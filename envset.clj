#!/usr/bin/env bb
(ns envset
  "Convert edn-based configs to env files."
  (:require [clojure.edn :as edn]
            [clojure.string :as str]))

(defn flatten-paths
  "Convert a nested hashmap to [path] value one."
  ([m]
   (flatten-paths m []))
  ([m path]
   (reduce-kv
    (fn [acc k v]
      (let [new-key (if path
                      (conj path k)
                      k)]
        (if (map? v)
          (merge acc (flatten-paths v new-key))
          (assoc acc new-key v))))
    {}
    m)))

(defn- path->env-name [path]
  (->> path
       (map (comp #(str/replace % #"\-" "_") str/upper-case name))
       (str/join "_")))

(defn- pp-value [value]
  (cond
    (vector? value) (str/join ":" value) ; PATH
    (number? value) value
    (string? value) (format "\"%s\"" value)
    :else (format "'%s'/" (str value))))

(defn- envmap->source [m]
  (->> m
       (map (fn [[path value]]
              (str (path->env-name path) "=" (pp-value value))))
       sort
       (str/join "\n")))


(comment
  (->> (slurp "env.edn")
       edn/read-string
       flatten-paths
       envmap->source
       (spit "/tmp/env.sh")
       ))
