(defun setup-decorations ()
  (setq inhibit-splash-screen t)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (blink-cursor-mode -1)
  (setq ring-bell-function 'ignore))

(defun setup-editor ()
  (setq backup-inhibited t)
  (setq auto-save-default nil)
  (electric-pair-mode +1)
  (electric-indent-mode +1)
  (prefer-coding-system 'utf-8))

(defun setup-color-theme ()
  (use-elpa-package 'solarized-theme
  		    (load-theme 'solarized-light t)))

(defun install-keybindings ()
  (global-set-key (kbd "M-DEL") 'undo)
  (global-set-key (kbd "C-/") 'dabbrev-expand))

(defun turn-on-ido ()
  (require 'ido)
  (ido-mode t))

(defun turn-on-windmove ()
  (require 'windmove)
  (windmove-default-keybindings))

(defun turn-on-paren-mode ()
  (show-paren-mode +1)
  (setq show-paren-delay 0)
  (set-face-attribute 'show-paren-match-face nil :inverse-video nil :weight 'bold))

(defun turn-on-volatile-highlights ()
  (use-elpa-package 'volatile-highlights
		    (require 'volatile-highlights)
		    (volatile-highlights-mode +1)))

(setup-decorations)
(setup-color-theme)
(setup-editor)
(install-keybindings)
(turn-on-ido)
(turn-on-windmove)
(turn-on-paren-mode)
(turn-on-volatile-highlights)
