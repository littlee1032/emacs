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

(setq user-full-name "LittleE")
(setq user-email-address "LittleE1032@gmail.com")

;; tramp
(setq tramp-default-method "ssh")

;; do not bell when doing wrong operation
(setq debug-on-error t)

;; key-binding
(global-set-key (kbd "C-x C-b") 'buffer-menu-other-window)
(global-set-key (kbd "S-<left>") 'windmove-left) 
(global-set-key (kbd "S-<right>") 'windmove-right) 
(global-set-key (kbd "S-<up>") 'windmove-up) 
(global-set-key (kbd "S-<down>") 'windmove-down)

;; auto-install
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(setq auto-install-save-confirm nil)

;; icicles
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))
(require 'icicles)
(icy-mode 1)
