#!/usr/bin/guile -s
!#

(use-modules (ice-9 popen))

(define argc
    (length (command-line)))
(define (argv n)
    (if (>= n argc)
        ""
        (list-ref (command-line) n)))
(define NOTIFY "notify-send -i xmms") 
(define artist (argv 1))
(define title (argv 2))
(define album (argv 3))

(define (notify header text)
    (define p (open-input-pipe (string-append NOTIFY " '" header "'  '" text "'")))
    (close-pipe p))

(notify (string-append artist " - " title) album)
