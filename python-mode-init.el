(add-third-party-dir "bundled/pymacs")
;(require 'pymacs)

;(add-to-list 'pymacs-load-path (third-party-dir "bundled/rope"))
;(add-to-list 'pymacs-load-path (third-party-dir "bundled/ropemacs"))
;(add-to-list 'pymacs-load-path (third-party-dir "bundled/ropemode"))
;(pymacs-load "ropemacs" "rope-")

(add-hook 'python-mode-hook
	  '(lambda ()
	     (define-key python-mode-map "\C-m" 'newline-and-indent)))


