;; cus
(display-time)
(column-number-mode t)
(transient-mark-mode t)
(tool-bar-mode -1)
(setq-default make-backup-files nil)
(setq frame-title-format "%f     size:%I")
(toggle-truncate-lines 1)
(setq default-major-mode 'text-mode)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(fset 'yes-or-no-p 'y-or-n-p)
(auto-fill-mode 1)
(setq adaptive-fill-mode nil)
(setq require-final-newline t)
(setq next-line-add-newlines nil)
(setq inhibit-startup-message t)
(setq tab-width 4)
(setq-default c-basic-offset 4)
;; (setq-default indent-tabs-mode nil) ;; tabs are evil

(setq user-full-name "LittleE")
(setq user-email-address "LittleE1032@gmail.com")

;; tramp
(setq tramp-default-method "ssh")

;; do not bell when doing wrong operation
(setq debug-on-error t)

;; key-binding
(global-set-key (kbd "C-x C-b") 'buffer-menu-other-window)
(global-set-key (kbd "C-<left>") 'windmove-left) 
(global-set-key (kbd "C-<right>") 'windmove-right) 
(global-set-key (kbd "C-<up>") 'windmove-up) 
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-x C-g") 'goto-line)
(global-set-key [f1] 'other-window)
(global-set-key [f9] 'delete-other-windows)

;; auto-install
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(setq auto-install-save-confirm nil)

;; icicles
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))
(require 'icicles)
(icy-mode 1)

;; configure whitespace-mode
(require 'whitespace)
(setq whitespace-style '(face trailing lines space-before-tab indentation space-after-tab) whitespace-line-column 160)
(setq my-hook-for-whitespace '(lambda() (whitespace-mode t)))
(add-hook 'c-mode-hook my-hook-for-whitespace)
(add-hook 'c++-mode-hook my-hook-for-whitespace)
(add-hook 'java-mode-hook my-hook-for-whitespace)
(add-hook 'emacs-lisp-mode-hook my-hook-for-whitespace)
(add-hook 'sgml-mode-hook my-hook-for-whitespace)
(add-hook 'shell-script-mode-hook my-hook-for-whitespace)
(add-hook 'diff-mode-hook my-hook-for-whitespace)
