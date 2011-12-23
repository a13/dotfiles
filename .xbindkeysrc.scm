(define (aosd-echo text)
  (define osdcmd "aosd_cat -x 0 -y 0 -t 2 -p 1 -n Consolas\\ 22 -f 100 -u 2000 -o 200 -R white -l 5")
  (run-command (string-append "echo $@ " text "|" osdcmd)))
 
(define (run-and-osd keys cmd osd-text)
  (xbindkey-function keys
                     (lambda () 
                       (run-command cmd)
                       (aosd-echo osd-text))))

(define (bind-switch-to-desk number)
  (if (>= number 0)
    (let ((wmcmd (string-append "wmctrl -s " (number->string number))))
      (xbindkey
       (list 'mod4 (string-append "c:1" (number->string number))) wmcmd)
      (xbindkey
       (string-append "c:19" (number->string (+ 2 number))) wmcmd)
      (bind-switch-to-desk (- number 1)))))

(bind-switch-to-desk 7)

(define xterm "urxvtcd") 
(define sleep-command "dbus-send --system --print-reply --dest=\"org.freedesktop.UPower\" /org/freedesktop/UPower org.freedesktop.UPower.Suspend")

;; misc commands
(xbindkey '(mod4 r) "/home/dk/bin/rundmenu")
(xbindkey '(mod4 w) "/home/dk/bin/windmenu")
(xbindkey '(mod4 b) "x-www-browser")
(xbindkey '(mod4 l) "xscreensaver-command -lock || (xscreensaver -no-splash & xscreensaver-command -lock)")
(xbindkey '(mod4 t) xterm)
(xbindkey '(mod4 e) "emacsclient -c -a \"\"")

(xbindkey '(Print) "scrot /tmp/scrot.png")
(xbindkey '(Shift Print) "scrot -s /tmp/scrot.png")

;; window controls
(xbindkey '(mod4 Up) "wmctrl -r :ACTIVE: -b toggle,maximized_vert")
(xbindkey '(mod4 Right) "wmctrl -r :ACTIVE: -b toggle,maximized_horz")
(xbindkey '(mod4 a) "wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz")
(xbindkey '(mod4 x) "wmctrl -c :ACTIVE:")

;; samsung n145 shortcuts
;; Fn+Esc - XF86Sleep
(xbindkey '(XF86Sleep) sleep-command)
;; Fn+F2 - XF86Battery
;; (xbindkey '(XF86Battery) "")
;; Fn+F4 - XF86Display
(xbindkey '(XF86Display) "~/bin/togglemon.sh")
;; Fn+F5 - XF86Launch1
(xbindkey '(XF86Launch1) "samsung-tools --quiet --backlight toggle")
;; Fn+F6 - XF86AudioMute
(xbindkey '(XF86AudioMute) "amixer set Master toggle")
;; Fn+F7 - XF86Launch2
;; (xbindkey '(XF86Launch2) "")
(xbindkey '(XF86Launch2) "samsung-tools --quiet --cpu cycle")
;; Fn+F8 - XF86Launch3
(xbindkey '(XF86Launch3) "samsung-tools --quiet --webcam toggle")
;; Fn+F9 - XF86WLAN
(xbindkey '(XF86WLAN) "samsung-tools --quiet --wireless toggle")
;; Fn+Down - XF86MonBrightnessDown
(xbindkey '(XF86MonBrightnessDown) "pgrep xbacklight || xbacklight -dec 15 -time 100 -steps 1")
;; Fn+Up - XF86MonBrightnessUp
(xbindkey '(XF86MonBrightnessUp) "pgrep xbacklight || xbacklight -inc 15 -time 100 -steps 1")
;; Fn+Right - XF86AudioRaiseVolume
(xbindkey '(XF86AudioRaiseVolume) "amixer set Master 1+")
;; Fn+Left - XF86AudioLowerVolume
(xbindkey '(XF86AudioLowerVolume) "amixer set Master 1-")

(xbindkey '(mod4 XF86AudioRaiseVolume) "nyxmms2 next") 
(xbindkey '(mod4 XF86AudioLowerVolume) "nyxmms2 prev")

(xbindkey '(mod4 XF86MonBrightnessDown) "nyxmms2 pause")
(xbindkey '(mod4 XF86MonBrightnessUp) "nyxmms2 play")


;; misc multimedia keys
;; <XF86HomePage>
(xbindkey '(XF86HomePage) "x-www-browser")
;; <XF86Search> 
;; <XF86Mail> 
;; <XF86Favorites> 
;; <XF86Calculator> 
;; <XF86New> 
;; <SunOpen> 
;; <XF86Close> 
;; <XF86Reply> 
;; <XF86MailForward> 
;; <XF86Send>
;; <XF86Save>
;; <print>
;; <XF86AudioPlay>
