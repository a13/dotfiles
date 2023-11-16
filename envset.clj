#!/usr/bin/env bb
(ns envset
  "Convert edn-based configs to env files."
  (:require [clojure.edn :as edn]
            [clojure.string :as str]))

(defn- path->env-name [path]
  (->> path
       (map (comp #(str/replace % #"\-" "_") str/upper-case name))
       (str/join "_")))

(defn- pp-value [value]
  (cond
    (vector? value) (str/join ":" value) ; PATH
    (number? value) value
    (string? value) (format "'%s'" value)
    :else (format "'%s'" (str value))))

(defn- envmap->source [m]
  (->> m
       (map (fn [[path  value]]
              (str (path->env-name path) "=" (pp-value value))))
       sort
       (str/join "\n")))

;; based on https://andersmurphy.com/2019/11/30/clojure-flattening-key-paths.html
(defn flatten-paths
  "Convert a nested hashmap to path:value one."
  ([m path]
   (lazy-seq
    (when-let [[[k v] & xs] (seq m)]
      (let [rest-flatten (flatten-paths xs path)
            path* (conj path k)]
        (if (and (map? v) (seq v))
          (into (flatten-paths v path*) rest-flatten)
          (cons [path* v] rest-flatten))))))
  ([m]
   (into {} (flatten-paths m []))))

(comment
  (->> (slurp "env.edn")
       edn/read-string
       flatten-paths
       envmap->source
       (spit "/tmp/env.sh")
       ))
