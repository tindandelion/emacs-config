(add-bundled-library-dir "python")

(setq python-lib-dir 
      (file-name-as-directory 
       (concat third-party-dir "bundled/python/lib/python")))
(setq python-libs 
      '("rope-0.9.3-py2.6.egg" 
	"ropemacs-0.6-py2.6" 
	"ropemode-0.1_rc2-py2.6"))

(setq pymacs-load-path
      (mapcar (lambda (value)
		(concat python-lib-dir value))
	      python-libs))
      
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
