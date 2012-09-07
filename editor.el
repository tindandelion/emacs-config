(defun setup-decorations ()
  (setq inhibit-splash-screen t)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defun setup-editor ()
  (setq backup-inhibited t)
  (setq auto-save-default nil)
  (electric-pair-mode +1)
  (electric-indent-mode +1)
  (prefer-coding-system 'utf-8))

(defun turn-on-ido ()
  (require 'ido)
  (ido-mode t))

(defun turn-on-windmove ()
  (require 'windmove)
  (windmove-default-keybindings))

(setup-decorations)
(setup-editor)
(turn-on-ido)
(turn-on-windmove)

