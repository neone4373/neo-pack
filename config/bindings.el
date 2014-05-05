;; Place your bindings here.


(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


;;increment and decrement number at point
(define-key org-mode-map (kbd "C-M--")    'live-decrement-number-at-point)
(global-set-key (kbd "C-M--")  'live-decrement-number-at-point)


;; Set bindings for better comment / uncomment (note that 'comment-dwim-line' must be defined above in ../init.el)
(global-set-key (kbd "M-;") 'comment-dwim-line)
(define-key paredit-mode-map (kbd "M-;") 'comment-dwim-line)
(if (equal "xterm" (tty-type))
    (define-key input-decode-map "\e[1;2A" [S-up]))


;; Set the meta+` to switch between windows
(global-set-key (kbd "M-`") 'next-multiframe-window)

;; Set the meta+` to switch between windows
(global-set-key (kbd "M-~") 'previous-multiframe-window)
