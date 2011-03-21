(add-third-party-dir "bundled/ruby-mode")

(autoload 'run-ruby "inf-ruby"
  "Run inferior Ruby interpreter")
(autoload 'inf-ruby-keys "inf-ruby" 
  "Add inf-ruby keys to ruby mode map")

(defun ruby-mode-keys ()
  (define-key ruby-mode-map "\r" 'reindent-then-newline-and-indent)
  (define-key ruby-mode-map "\C-\M-j" 'insert-new-line)
  (define-key ruby-mode-map "\M-\r" 'insert-new-line))

(defun customize-ruby-mode ()
  (ruby-mode-keys)
  (inf-ruby-keys))

(add-hook 'ruby-mode-hook 'customize-ruby-mode)






