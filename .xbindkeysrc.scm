(define (aosd-echo text)
  (define osdcmd "aosd_cat -x 0 -y 0 -t 2 -p 1 -n Consolas\\ 22 -f 100 -u 2000 -o 200 -R white -l 5")
  (run-command (string-append "echo $@ " text "|" osdcmd)))
 
(define (run-and-osd keys cmd osd-text)
  (xbindkey-function keys
                     (lambda () 
                       (run-command cmd)
                       (aosd-echo osd-text))))
(define xterm "urxvtcd") 
 
(xbindkey '(mod4 r) "/home/dk/bin/rundmenu")
(xbindkey '(mod4 w) "/home/dk/bin/windmenu")
(xbindkey '(mod4 q) "/home/dk/bin/emacswitch.sh")
(xbindkey '(mod4 f) "/home/dk/bin/dmenfm")
(xbindkey '(mod4 u) "scrot -s ~/resul.png")
(xbindkey '(mod4 l) "xscreensaver-command -lock || (xscreensaver -no-splash & xscreensaver-command -lock)")
(xbindkey '(mod4 t) xterm)
(xbindkey '(mod4 e) "emacsclient -c -a \"\"")


;;(xbindkey '("c:193") "xterm")

(xbindkey '(XF86Forward) "mocp -f")
(xbindkey '(XF86Back) "mocp -r")
;;(xbindkey 'XF86AudioPrev "mocp -r")
(xbindkey '(XF86AudioPlay) "scrot -s resul.png")
(xbindkey '(XF86AudioStop) "mocp -s")
;;(xbindkey 'XF86AudioStop "mocp -s")
(xbindkey '(XF86AudioMute) (string-append xterm " -e mocp -y"))
(run-and-osd '(mod4 g) "gvim" "Gvim")
 
 
;; (define (bind-switch-to-desk number)
;;   (if (>= number 0)
;;     (begin
;;       (xbindkey
;;        (list 'mod4 (string-append "c:1" (number->string number)))
;;        (string-append "wmctrl -s " (number->string number)))
;;       (bind-switch-to-desk (- number 1)))))
 
(define (bind-switch-to-desk number)
  (if (>= number 0)
    (let ((wmcmd (string-append "wmctrl -s " (number->string number))))
      (xbindkey
       (list 'mod4 (string-append "c:1" (number->string number))) wmcmd)
      (xbindkey
       (string-append "c:19" (number->string (+ 2 number))) wmcmd)
      (bind-switch-to-desk (- number 1)))))

(bind-switch-to-desk 7)

;;window controls
(xbindkey '(mod4 Up) "wmctrl -r :ACTIVE: -b toggle,maximized_vert")
(xbindkey '(mod4 Right) "wmctrl -r :ACTIVE: -b toggle,maximized_horz")
(xbindkey '(mod4 a) "wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz")
(xbindkey '(Mod4 x) "wmctrl -c :ACTIVE:")
(xbindkey '(Alt F4) "wmctrl -c :ACTIVE:")

