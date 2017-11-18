(defun setup-decorations ()
  (setq inhibit-splash-screen t)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (blink-cursor-mode +1)
  (setq ring-bell-function 'ignore))

(defun setup-editor ()
  (setq backup-inhibited t)
  (setq auto-save-default nil)
  (setq truncate-lines t)
  (delete-selection-mode +1)
  (put 'erase-buffer 'disabled nil)
  (global-auto-revert-mode +1)
  (electric-pair-mode +1)
  (electric-indent-mode +1)
  (prefer-coding-system 'utf-8)
  (setup-default-directory))

(defun setup-default-directory ()
  (setq default-directory (concat (getenv "HOME") "/")))

(defun setup-color-theme ()
  (use-elpa-package 'solarized-theme
    (load-theme 'solarized-light t)))

(defun setup-recentf ()
  (require 'recentf)
  (defun recentf-ido-find-file ()
    (interactive)
    (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
      (when file
	(find-file file))))
  (recentf-mode))

(defun install-keybindings ()
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "M-DEL") 'undo)
  (global-set-key (kbd "M-/") 'hippie-expand)
  (global-set-key (kbd "C-/") 'hippie-expand)
  (global-set-key (kbd "C-x C-r") 'recentf-ido-find-file)
  
  (global-set-key (kbd "<s-right>") 'move-end-of-line)
  (global-set-key (kbd "<s-left>") 'move-beginning-of-line)
  (global-set-key (kbd "s-.") 'ff-find-other-file))

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

(defun uniquify-buffer-names ()
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward))

(setup-decorations)
(setup-color-theme)
(setup-editor)
(setup-recentf)
(install-keybindings)
(turn-on-ido)
(turn-on-windmove)
(turn-on-paren-mode)
(turn-on-volatile-highlights)
(uniquify-buffer-names)
