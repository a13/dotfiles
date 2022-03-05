(use-modules (ice-9 format))
;; (use-modules (system repl server))
;; (spawn-server)


(define (bind-switch-to-desk number)
  (if (>= number 0)
    (let ((wmcmd (string-append "wmctrl -s " (number->string number))))
      (xbindkey
       (list 'mod4 (string-append "c:1" (number->string number))) wmcmd)
      (xbindkey
       ;; MS Natural
       (string-append "c:19" (number->string (+ 2 number))) wmcmd)
      (bind-switch-to-desk (- number 1)))))

(bind-switch-to-desk 7)

(define xterm "urxvtcd")
(define sleep-command "dbus-send --system --print-reply --dest=\"org.freedesktop.UPower\" /org/freedesktop/UPower org.freedesktop.UPower.Suspend")

(define (ec exp)
  (string-append "emacsclient -c --eval "
                 (format #f "\"~s\"" exp)))

(define (webapp url)
  (format #f "chromium-browser --app=~s" url))

;; misc commands
(xbindkey '(mod4 r) "/home/dk/bin/rundmenu")
(xbindkey '(mod4 w) "/home/dk/bin/windmenu xwin ebuf xdesk")
(xbindkey '(mod4 h) "/home/dk/bin/webjump.sh chromium-browser")
(xbindkey '(mod4 m) (webapp "https://web.telegram.org"))
(xbindkey '(mod4 y) (webapp "https://maps.yandex.ru"))
(xbindkey '(mod4 g) (webapp "https://maps.google.com"))
(xbindkey '(mod4 o) (webapp "https://openstreetmap.org"))
(xbindkey '(mod4 c) (webapp "https://calendar.google.com/"))
(xbindkey '(XF86Mail) (webapp "https://mail.google.com"))
(xbindkey '(XF86Search) "x-www-browser")

(xbindkey '(mod4 b) "x-www-browser")
(xbindkey '(mod4 l) "xscreensaver-command -lock || (xscreensaver -no-splash & xscreensaver-command -lock)")
(xbindkey '(mod4 t) xterm)
(xbindkey '(mod4 e) "emacsclient -c -a \"\"")
(xbindkey '(mod4 j)
          (ec '(call-interactively 'telega-chat-with)))

;;          "emacsclient -c --eval \"(call-interactively 'jabber-chat-with)\"")

(xbindkey '(Print) "flameshot gui -p /tmp")
(xbindkey '(Shift Print) "flameshot full -c -p /tmp")

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
;; (xbindkey '(XF86Launch2) "samsung-tools --quiet --cpu cycle")
;; Fn+F8 - XF86Launch3
;; (xbindkey '(XF86Launch3) "samsung-tools --quiet --webcam toggle")
;; Fn+F9 - XF86WLAN
;; (xbindkey '(XF86WLAN) "samsung-tools --quiet --wireless toggle")
;; Fn+Down - XF86MonBrightnessDown
(xbindkey '(XF86MonBrightnessDown) "pgrep acpilight || acpilight -dec 15 -time 100 -steps 1")
;; Fn+Up - XF86MonBrightnessUp
(xbindkey '(XF86MonBrightnessUp) "pgrep acpilight || acpilight -inc 15 -time 100 -steps 1")
;; Fn+Right - XF86AudioRaiseVolume
(xbindkey '(XF86AudioRaiseVolume) "amixer set Master 1+")
;; Fn+Left - XF86AudioLowerVolume
(xbindkey '(XF86AudioLowerVolume) "amixer set Master 1-")

(xbindkey '(mod4 XF86AudioRaiseVolume) "xmms2 next")
(xbindkey '(mod4 XF86AudioLowerVolume) "xmms2 prev")

(xbindkey '(mod4 XF86MonBrightnessDown) "xmms2 toggle")
(xbindkey '(mod4 XF86MonBrightnessUp) "xmms2 toggle")

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
(xbindkey '(XF86AudioPlay) "xmms2 toggle")
