(defun setup-text-mode ()
  (add-hook 'text-mode-hook 
	  '(lambda ()
	     (setq fill-column 80)
	     (turn-on-auto-fill))))

(defun setup-markdown-mode ()
  (use-elpa-package 'markdown-mode
    (add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))))

(setup-text-mode)
(setup-markdown-mode)


