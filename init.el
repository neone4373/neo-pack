;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.


;; Disable the zoning upon start
(setq live-disable-zone t)


;; Comment shortcut function
;; Original idea from
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
    (interactive "*P")
      (comment-normalize-vars)
        (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
                  (comment-or-uncomment-region (line-beginning-position) (line-end-position))
              (comment-dwim arg)))


;; Load bindings config
(live-load-config-file "bindings.el")

;; scroll one line at a time (less "jumpy" than defaults)

(setq mouse-wheel-scroll-amount '(4 ((shift) . 4))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Set default window width and height
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 40))
  (add-to-list 'default-frame-alist '(width . 99)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

 ;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
 (set-frame-parameter (selected-frame) 'alpha '(85 50))
 (add-to-list 'default-frame-alist '(alpha 85 50))

;;Create a C-c t to toggle transparency
 (eval-when-compile (require 'cl))
 (defun toggle-transparency ()
   (interactive)
   (if (/=
        (cadr (frame-parameter nil 'alpha))
        100)
       (set-frame-parameter nil 'alpha '(100 100))
     (set-frame-parameter nil 'alpha '(85 50))))
 (global-set-key (kbd "C-c t") 'toggle-transparency)

;; Set the default font and size
 (live-set-default-darwin-font "Menlo-12")

;; CIDER config
;; Don't show special nrepl buffers in C-x b buffer switching
(setq nrepl-hide-special-buffers t)
;; Use paredit minor mode while in cider repl
(add-hook 'cider-repl-mode-hook 'paredit-mode)
;; Enable rainbow delimiters in cider REPL
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)


;; ;; Add ECB pack and set custom configuration
;; (live-add-pack-lib "ecb")
;; (require 'ecb)
;; ;; CHANGE THIS TO THE PATH TO YOUR SOURCES
;; ;; (note that you can also modify the relevant property to add multiple dirs)
;; (defvar start-dir "/Users/neo/Documents/Projects")
;; (custom-set-variables
;;  '(ecb-options-version "2.32")
;;  '(ecb-source-path (list start-dir))
;;  '(ecb-tip-of-the-day nil)
;;  '(inhibit-startup-screen t))


;; ;; Function that creates a speedbar, but in the same frame vs. the
;; ;; default separate frame
;; (require 'speedbar)
;; (defconst my-speedbar-buffer-name " SPEEDBAR")
;; (defun my-speedbar-no-separate-frame ()
;;     (interactive)
;;     (when (not (buffer-live-p speedbar-buffer))
;;       (setq speedbar-buffer (get-buffer-create my-speedbar-buffer-name)
;;             speedbar-frame (selected-frame)
;;             dframe-attached-frame (selected-frame)
;;             speedbar-select-frame-method 'attached
;;             speedbar-verbosity-level 0
;;             speedbar-last-selected-file nil)
;;       (set-buffer speedbar-buffer)
;;       (speedbar-mode)
;;       (speedbar-reconfigure-keymaps)
;;       (speedbar-update-contents)
;;       (speedbar-set-timer 1)
;;       (add-hook 'kill-buffer-hook
;;                 (lambda () (when (eq (current-buffer) speedbar-buffer)
;;                              (setq speedbar-frame nil
;;                                    dframe-attached-frame nil
;;                                    speedbar-buffer nil)
;;                              (speedbar-set-timer nil)))))
;; ;;    (message "CATS!!!!")
;;     (set-window-buffer (selected-window)
;;                        (get-buffer my-speedbar-buffer-name))
;;     )
;; ;; Start Speedbar
;; ;; (my-speedbar-separate-frame)
;; (my-speedbar-no-separate-frame)
;; ;; Speedbar customizations
;; (speedbar-add-supported-extension ".clj")
;; (setq speedbar-show-unknown-files t)


;; Start ECB mode
;; (ecb-activate)



;; Add line numbers (kinda buggy, but better than nothing?)
;; (global-linum-mode t)
