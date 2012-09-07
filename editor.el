(defun setup-decorations ()
  (setq inhibit-splash-screen t)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defun setup-editor ()
  (electric-pair-mode +1)
  (electric-indent-mode +1))

(setup-decorations)
(setup-editor)


