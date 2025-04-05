; Packages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("melpa" ."https://melpa.org/packages/") t)
(package-initialize) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic Setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;dsiable auto CR-LF
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows t)

;;; don't make backup #*
(setq make-backup-files nil)
;;; don't make backup *~
(setq auto-save-default nil)

;; don't show initial message
(setq inhibit-startup-message t)

;; Default font color
(set-foreground-color "White")
(set-background-color "Black")

;; tab size to 4
(setq-default tab-width 4 indent-tabs-mode nil)

;; Default window size
(setq initial-frame-alist
      (append
       '((top                 . 10)
         (left                . 0)
         (width               . 100)
         (height              . 60))
       initial-frame-alist))

;; Reload function
(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting for verilog mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.vh\\'" . verilog-mode))
(add-to-list 'auto-mode-alist '("\\.sv\\'" . verilog-mode))
(add-to-list 'auto-mode-alist '("\\.svh\\'" . verilog-mode))
(add-to-list 'auto-mode-alist '("\\.vams\\'" . verilog-mode))
(add-hook 'verilog-mode-hook
  (lambda ()
    (setq tab-width 2)
    (setq indent-tabs-mode nil)
    (setq verilog-indent-lists nil)
    (setq verilog-indent-level 2)
    (setq verilog-indent-level-module 2)
    (setq verilog-indent-level-behavioral 2)
    (setq verilog-indent-level-declaration 2)
    (setq verilog-indent-level-directive 2)
    (setq verilog-case-indent 2)
    (setq verilog-auto-newline nil)
    (setq verilog-auto-indent-on-newline nil)
    (setq font-lock-multiline t)
    (make-face 'prohibit-keyword-face)
    (set-face-background 'prohibit-keyword-face "Yellow")
    (font-lock-add-keywords nil
      '(
        ;("\\<\\(FIXME\\):" 0 'block-keyword-face t)
        ("\t" 0 'prohibit-keyword-face t)
        (" *$" 0 'prohibit-keyword-face t)
      )
    )
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting For multiple Cursor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(package-selected-packages (quote (multiple-cursors))))
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; )

(setq load-path (cons "~/.emacs.d/elisp/cl-lib" load-path))
(setq load-path (cons "~/.emacs.d/elisp/multiple-cursors" load-path))
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-D") 'mc/mark-all-like-this)
