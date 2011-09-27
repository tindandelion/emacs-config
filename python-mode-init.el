(defun load-ropemacs ()
  (interactive)
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-confirm-saving 'nil))

(defun install-keybindings ()
  (define-key python-mode-map "\C-m" 'newline-and-indent))

(defun flymake-create-temp-in-system-tempdir (filename prefix)
  (make-temp-file (or prefix "flymake")))

(defun enable-pyflakes ()
  (when (load "flymake" t) 
    (defun flymake-pyflakes-init () 
      ;; Make sure it's not a remote buffer or flymake would not work
      (when (not (subsetp (list (current-buffer)) (tramp-list-remote-buffers)))
	(let* ((temp-file (flymake-init-create-temp-buffer-copy 
			   'flymake-create-temp-in-system-tempdir)) 
	       (local-file (file-relative-name 
			    temp-file 
			    (file-name-directory buffer-file-name)))) 
	  (list "pyflakes" (list local-file)))))
    (add-to-list 'flymake-allowed-file-name-masks 
		 '("\\.py\\'" flymake-pyflakes-init))))

(eval-after-load 'python '(load-ropemacs))
(add-hook 'python-mode-hook
	  '(lambda ()
	     (enable-pyflakes)
	     (flymake-mode t)
	     (ropemacs-mode t)
	     (install-keybindings)))


