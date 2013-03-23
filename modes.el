(defmacro setup-mode (mode-name &rest body)
  (declare (indent defun))
  `(progn ,@body))

(setup-mode 'text-mode
  (add-hook 'text-mode-hook 
	    '(lambda ()
	       (setq fill-column 80)
	       (turn-on-auto-fill))))

(defun assoc-with-mode (mode regex-list)
  (dolist (regex regex-list)
    (add-to-list 'auto-mode-alist (cons regex mode))))

(setup-mode 'markdown-mode
  (use-elpa-package 'markdown-mode
    (assoc-with-mode 'markdown-mode '("\\.markdown" "\\.md"))))

(setup-mode 'ruby-mode
  (use-elpa-package 'ruby-mode)
  (add-hook 'ruby-mode-hook
	    '(lambda ()
	       (use-elpa-package 'rvm)
	       (rvm-activate-corresponding-ruby)
	       (add-to-list (make-local-variable 'electric-pair-pairs)
			    '(?| . ?|))))
  (assoc-with-mode 'ruby-mode '("Rakefile" "Gemfile" "Vagrantfile")))

(setup-mode 'dired
  (setq dired-recursive-copies 'top)
  (setq dired-recursive-deletes 'top)
  (setq dired-dwim-target t))

(setup-mode 'clojure-mode
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode))
