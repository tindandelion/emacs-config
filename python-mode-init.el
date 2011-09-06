(add-third-party-dir "bundled/pymacs")
;(require 'pymacs)

;(add-to-list 'pymacs-load-path (third-party-dir "bundled/rope"))
;(add-to-list 'pymacs-load-path (third-party-dir "bundled/ropemacs"))
;(add-to-list 'pymacs-load-path (third-party-dir "bundled/ropemode"))
;(pymacs-load "ropemacs" "rope-")

(defun install-keybindings ()
  (define-key python-mode-map "\C-m" 'newline-and-indent))

(defun enable-pyflakes ()
  (when (load "flymake" t) 
    (defun flymake-pyflakes-init () 
      ;; Make sure it's not a remote buffer or flymake would not work
      (when (not (subsetp (list (current-buffer)) (tramp-list-remote-buffers)))
	(let* ((temp-file (flymake-init-create-temp-buffer-copy 
			   'flymake-create-temp-inplace)) 
	       (local-file (file-relative-name 
			    temp-file 
			    (file-name-directory buffer-file-name)))) 
	  (list "pyflakes" (list local-file)))))
    (add-to-list 'flymake-allowed-file-name-masks 
		 '("\\.py\\'" flymake-pyflakes-init))))

(add-hook 'python-mode-hook
	  '(lambda ()
	     (enable-pyflakes)
	     (flymake-mode t)
	     (install-keybindings)))


