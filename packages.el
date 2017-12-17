(defun setup-package-system ()
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/")))

(defun ensure-package-installed (package)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(defmacro use-elpa-package (name &rest body)
  (declare (indent defun))
  `(progn
     (ensure-package-installed ,name)
     ,@body))

(setup-package-system)

(use-elpa-package 'magit
  (global-set-key (kbd "C-x g") 'magit-status))

(use-elpa-package 'expand-region
  (require 'expand-region)
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "M-<up>") 'er/expand-region))

(use-elpa-package 'smex
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))

(use-elpa-package 'ack
  (global-set-key (kbd "M-<f7>") 'ack))

(use-elpa-package 'exec-path-from-shell)
;; (use-elpa-package 'full-ack
;;   (setq ack-project-root-file-patterns
;; 	'("\\`.git\\'" "\\`.hg\\'" "Gemfile$"))
;;   (global-set-key (kbd "C-c a") 'ack-same)
;;   (global-set-key (kbd "C-c A") 'ack))
