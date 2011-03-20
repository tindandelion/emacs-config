;; Turn off annoying visual and sound stuff
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-message t)
(setq transient-mark-mode t)

;; Coding system
(prefer-coding-system 'utf-8)

;; Turn off backups and auto-save
(setq backup-inhibited t)
(setq auto-save-default nil)

;; Make colored input look pretty in shell 
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on) 

;; Turn on ido mode for nice file opening a buffer switching
(require 'ido)
(ido-mode t)

;; Turn on cua mode
(cua-mode t)
