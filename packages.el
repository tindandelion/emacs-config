(require 'package)

(defvar dnl-required-packages
  (list 'zenburn-theme))

(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(dolist (package dnl-required-packages)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(load-theme 'zenburn t)
