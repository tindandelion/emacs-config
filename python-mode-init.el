(defun load-ropemacs ()
  (interactive)
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-confirm-saving 'nil))

(defun indent-for-newline ()
  (define-key python-mode-map "\C-m" 'newline-and-indent))

(defun flymake-create-temp-in-system-tempdir (filename prefix)
  (make-temp-file (or prefix "flymake")))

(defun local-buffer-p ()
  (not (subsetp (list (current-buffer)) (tramp-list-remote-buffers))))

(defun flymake-pyflakes () 
      (when (local-buffer-p)
	(let* ((temp-file (flymake-init-create-temp-buffer-copy 
			   'flymake-create-temp-in-system-tempdir)) 
	       (local-file (file-relative-name 
			    temp-file 
			    (file-name-directory buffer-file-name)))) 
	  (list "pyflakes" (list local-file)))))

(defun enable-pyflakes ()
  (when (load "flymake" t) 
    (add-to-list 'flymake-allowed-file-name-masks 
		 '("\\.py\\'" flymake-pyflakes))))

(eval-after-load 'python '(load-ropemacs))
(add-hook 'python-mode-hook
	  '(lambda ()
	     (enable-pyflakes)
	     (flymake-mode t)
	     (ropemacs-mode t)
	     (intelligent-tab-for-mode python-mode-map)
	     (indent-for-newline)))
