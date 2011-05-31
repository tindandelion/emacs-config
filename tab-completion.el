;; Use tab-completion to indent lines and also to auto-complete words
(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding
point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))

(defun tab-indent-or-expand ()
  (local-set-key "\t" 'indent-or-expand))
 
(add-hook 'c-mode-hook          'tab-indent-or-expand)
(add-hook 'sh-mode-hook         'tab-indent-or-expand)
(add-hook 'emacs-lisp-mode-hook 'tab-indent-or-expand)
(add-hook 'ruby-mode-hook       'tab-indent-or-expand)
(add-hook 'js-mode-hook         'tab-indent-or-expand)
(add-hook 'python-mode-hook     'tab-indent-or-expand)