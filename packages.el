(defun setup-package-system ()
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/")))

(defun ensure-package-installed (package)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(setup-package-system)

(ensure-package-installed 'zenburn-theme)
(load-theme 'zenburn t)

(ensure-package-installed 'magit)
(global-set-key "\C-xg" 'magit-status)

(ensure-package-installed 'expand-region)
(global-set-key "\M-=" 'er/expand-region)

