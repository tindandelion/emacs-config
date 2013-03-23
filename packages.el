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
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-elpa-package 'smex
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))

(use-elpa-package 'full-ack
  (global-set-key (kbd "C-c a") 'ack-same)
  (global-set-key (kbd "C-c A") 'ack))

(use-elpa-package 'clojure-mode)
