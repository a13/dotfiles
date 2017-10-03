;; -*-lisp-*-
;;
;; Here is a sample .stumpwmrc file
;debian=sbcl
(in-package :stumpwm)

;;load swank
;(asdf:oos 'asdf:load-op 'swank-asdf)
;;(clc:clc-require 'swank)
;;(swank:create-server :dont-close t :port 4010)


;; change the prefix key to something else
(set-prefix-key (kbd "C-z"))

;; prompt the user for an interactive command. The first arg is an
;; optional initial contents.
;;(defcommand colon1 (&optional (initial "")) (:rest)
;;  (let ((cmd (read-one-line (current-screen) ": " initial)))
;;    (when cmd
;;      (eval-command cmd t))))

(defun switch-group (cur last)
  (declare (ignore last))
  (echo (group-name cur)))

(add-hook *focus-group-hook* 'switch-group)
;; Read some doc
;;(define-key *root-map* (kbd "d") "exec gv")
;; Browse somewhere
;;(define-key *root-map* (kbd "b") "colon1 exec x-www-browser http://www.")
;; Ssh somewhere
;;(define-key *root-map* (kbd "C-s") "colon1 exec x-terminal-emulator -e ssh ")
;;(define-key *root-map* (kbd "C-t") "exec x-terminal-emulator")
;; Lock screen
;;(define-key *root-map* (kbd "C-l") "exec xlock")

;; Web jump (works for Google and Imdb)
;;(defmacro make-web-jump (name prefix)
;;  `(defcommand ,name (search) ((:rest ,(concatenate 'string name " search: ")))
;;    (substitute #\+ #\Space search)
;;    (run-shell-command (concatenate 'string ,prefix search))))

;;(make-web-jump "google" "x-www-browser http://www.google.fr/search?q=")
;;(make-web-jump "imdb" "x-www-browser http://www.imdb.com/find?q=")

;; C-t M-s is a terrble binding, but you get the idea.
;;(define-key *root-map* (kbd "M-s") "google")
;;(define-key *root-map* (kbd "i") "imdb")

;; Message window font
;;(set-font "-xos4-terminus-medium-r-normal--16-160-72-72-c-80-iso10646-1")
(set-font "-*-terminus-medium-r-*-*-16-*-*-*-*-*-iso10646-1")
;;(set-font "-*-doslike-normal-*-*-*-*-180-75-75-*-*-*-*")
;;(set-font "-misc-monaco-medium-r-normal--0-0-0-0-p-0-iso10646-1")
;(set-frame-outline-width 1)
;;(set-focus-color "gray26")
(set-focus-color "CornflowerBlue")
(set-unfocus-color "gray24")
(set-bg-color "black")
;(setf *frame-indicator-text* " Current frame ")
(setf *message-window-gravity* :top-right)
(setf *new-window-preferred-frame* '(:empty :focused))
(setf *menu-maximum-height* 50)
(setf *menu-scrolling-step* 1)
(setf *suppress-frame-indicator* nil)
(setf *normal-border-width* 1)
(setf *window-border-style* :thin)
(setf *mouse-focus-policy* :click)
;; change window numbers
;; (setf *frame-number-map* "1234567890")
;;(defun kill-empty-group-hook (win)
;;  (declare (ignore win))
;;  (unless (group-windows (current-group))
;;    (gkill)))
(setf *mode-line-position* :top)
;; Turn on the modeline
;;(if (not (head-mode-line (current-head)))
  ;;  (toggle-mode-line (current-screen) (current-head)))


;; Show the time in the modeline
;;(setf *screen-mode-line-format*
  ;;    (list '(:eval (run-shell-command "date '+%R, %F %a'|tr -d [:cntrl:]" t)) "[^B%n^b] %W"))
(setf *mode-line-border-width* 0)
(setf *mode-line-pad-y* 1)

(setf stumpwm:*screen-mode-line-format*
    (list "[^B%n^b] %W | ^B^07"
        '(:eval (stumpwm:run-shell-command "date '+%R' | xargs echo -n" t)) "^n^b"))
;; (setf *screen-mode-line-format*
;;       (list "^6*::^n  %g  ^6*::^n%w^6* :: ^8*CPU: ^n%f %C ^3*%t ^6*:: ^n^r%M ^6*:: ^n%b ^6*:: ^n %l ^6*::^8* - "
;; 	    '(:eval (run-shell-command "date +\"%T %d-%m-%Y\" | tr -d '[:cntrl:]'" t))))



;(setf *mode-line-screen-position* :bottom)
;(setf *mode-line-frame-position* :bottom)
;;(add-hook *destroy-window-hook* 'kill-empty-group-hook)

;;; Define window placement policy...

;; Clear rules
(clear-window-placement-rules)

;; Last rule to match takes precedence!

;; TIP: if the argument to :title or :role begins with an ellipsis, a substring
;; match is performed.
;; TIP: if the :create flag is set then a missing group will be created and
;; restored from *data-dir*/create file.
;; TIP: if the :restore flag is set then group dump is restored even for an
;; existing group using *data-dir*/restore file.
;;(define-frame-preference "Default"
;; frame raise lock (lock AND raise == jumpto)
;;  (0 t nil :class "Konqueror" :role "...konqueror-mainwindow")
;;  (1 t nil :class "XTerm"))

(grename "ws-default")
(mapc #'gnewbg
      '("ws-default"
        "ws-web"
        "ws-im"
        "ws-mail"
        "ws-media"
        "ws-virtual"
        "ws-remote"))

(gnewbg-float "ws-float")

(define-frame-preference "ws-web"
    (0 t t :class "Chromium"))



;(define-frame-preference "Ardour"
;  (0 t   t   :instance "ardour_editor" :type :normal)
;  (0 t   t   :title "Ardour - Session Control")
;  (0 nil nil :class "XTerm")
;  (1 t   nil :type :normal)
;  (1 t   t   :instance "ardour_mixer")
;  (2 t   t   :instance "jvmetro")
;  (1 t   t   :instance "qjackctl")
;  (3 t   t   :instance "qjackctl" :role "qjackctlMainForm"))

;(define-frame-preference "Shareland"
;  (0 t   nil :class "XTerm")
;  (1 nil t   :class "aMule"))

;(define-frame-preference "Emacs"
;  (1 t t :restore "emacs-editing-dump" :title "...xdvi")
;  (0 t t :create "emacs-dump" :class "Emacs"))
(define-key *top-map* (kbd "M-k") "move-focus up")
(define-key *top-map* (kbd "M-j") "move-focus down")
(define-key *top-map* (kbd "M-l") "move-focus right")
(define-key *top-map* (kbd "M-h") "move-focus left")
;; control-meta-hjkl
(define-key *top-map* (kbd "C-M-k") "move-window up")
(define-key *top-map* (kbd "C-M-j") "move-window down")
(define-key *top-map* (kbd "C-M-l") "move-window right")
(define-key *top-map* (kbd "C-M-h") "move-window left")

;;(defparameter *dbus-power-template* "dbus-send --system --print-reply --dest=\"org.freedesktop.Hal\" /org/freedesktop/Hal/devices/computer org.freedesktop.Hal.Device.SystemPowerManagement." )
(defparameter *dbus-power-template*
  "dbus-send --system --print-reply --dest=\"org.freedesktop.UPower\" /org/freedesktop/UPower org.freedesktop.UPower." )

(defmacro defcommand-pm (name command)
  `(defcommand ,name () ()
  	"pm command"
	       (run-shell-command (concatenate 'string *dbus-power-template* ,command))))
(defcommand-pm suspend "Suspend")
(defcommand-pm hibernate "Hibernate")
(defcommand-pm reboot "Reboot")
(defcommand-pm shutdown "Shutdown")
;;(resize-head 0 24 0 1000 600)
