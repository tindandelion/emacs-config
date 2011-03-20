(defun ruby-mode-keys ()
  (define-key ruby-mode-map "\r" 'reindent-then-newline-and-indent)
  (define-key ruby-mode-map "\C-\M-j" 'insert-new-line)
  (define-key ruby-mode-map "\M-\r" 'insert-new-line))

(defun customize-ruby-mode ()
  (ruby-mode-keys))

(add-hook 'ruby-mode-hook 'customize-ruby-mode)






