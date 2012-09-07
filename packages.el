(defun setup-package-system ()
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/")))

(defun ensure-package-installed (package)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(defmacro required-package (name &rest exprs)
  `(progn
     (ensure-package-installed ,name)
     ,@exprs))

(setup-package-system)

(required-package 'zenburn-theme
		  (load-theme 'zenburn t))

(required-package 'magit
		  (global-set-key "\C-xg" 'magit-status))

(required-package 'expand-region
		  (global-set-key "\M-=" 'er/expand-region))

(required-package 'rvm)

(required-package 'smex
		  (smex-initialize)
		  (global-set-key "\M-x" 'smex)
		  (global-set-key (kbd "M-X") 'smex-major-mode-commands))
