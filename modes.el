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

(setup-mode 'sml-mode
  (use-elpa-package 'sml-mode))

(setup-mode 'markdown-mode
  (use-elpa-package 'markdown-mode
    (assoc-with-mode 'markdown-mode '("\\.markdown" "\\.md"))))

(setup-mode 'groovy-mode
  (use-elpa-package 'groovy-mode
    (assoc-with-mode 'groovy-mode '("\\.gradle$" "\\.groovy$"))))

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
  (use-elpa-package 'clojure-mode)
  (use-elpa-package 'rainbow-delimiters)
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode))

(setup-mode 'org-mode
  (defun org-mode-keys ()
    (local-unset-key (kbd "S-<up>"))
    (local-unset-key (kbd "S-<down>"))
    (local-unset-key (kbd "S-<left>"))
    (local-unset-key (kbd "S-<right>")))
  
  (setq org-todo-keywords '((sequence "TODO" "STARTED" "DONE")))
  (setq org-log-into-drawer t)
  (setq org-todo-keyword-faces '(("STARTED" . org-warning)))
  (setq org-agenda-files (concat user-emacs-directory "org-projects"))
  (setq org-agenda-sorting-strategy
	'((agenda todo-state-down priority-down category-keep)
	  (todo priority-down category-keep)
	  (tags priority-down category-keep)
	  (search category-keep)))
  
  (add-hook 'org-mode-hook 'org-mode-keys)
  (add-hook 'org-agenda-mode-hook 'org-mode-keys)
  
  (global-set-key (kbd "ESC M-a")
		  (lambda () (interactive) (org-agenda-list 0))))

(setup-mode 'shell-mode
  (defun shell-mode-keys ()
    (local-set-key (kbd "C-l") 'erase-buffer))
  
  (add-hook 'shell-mode-hook 'shell-mode-keys))


(setup-mode 'auto-indent-mode
  (use-elpa-package 'auto-indent-mode))


(setup-mode 'rspec-mode
  (defun rspec-mode-keys ()
    (local-set-key (kbd "M-S-<f10>") 'rspec-verify))
  
  (use-elpa-package 'rspec-mode)
  (defalias 'first 'car)
  (setq rspec-use-bundler-when-possible nil)
  (setq rspec-use-rake-flag nil)
  (add-hook 'rspec-mode-hook 'rspec-mode-keys))

(assoc-with-mode 'octave-mode '("\\.m$"))
