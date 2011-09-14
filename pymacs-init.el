(setq pymacs-dir 
      (concat 
       third-party-dir 
       "bundled/python/pymacs/lib/python"))
(add-bundled-library-dir "python")

(setq pymacs-load-path 
      '("/Users/serg_mo/.emacs.d/third-party/bundled/python/lib/python/rope-0.9.3-py2.6.egg" 
	"/Users/serg_mo/.emacs.d/third-party/bundled/python/lib/python/ropemacs-0.6-py2.6.egg" 
	"/Users/serg_mo/.emacs.d/third-party/bundled/python/lib/python/ropemode-0.1_rc2-py2.6.egg"))

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path pymacs-dir))
