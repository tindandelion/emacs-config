(defun load-ropemacs ()
  (interactive)
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-confirm-saving 'nil))

(defun install-keybindings ()
  (define-key python-mode-map "\C-m" 'newline-and-indent)
  (define-key python-mode-map "\t" 'yas/expand)
  (setq yas/fallback-behavior '(apply tab-completion-after-yasnippet)))

(defun flymake-create-temp-in-system-tempdir (filename prefix)
  (make-temp-file (or prefix "flymake")))

(defun at-end-of-word ()
  (and (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after)))))))

(defun tab-completion-after-yasnippet ()
  (interactive)
  (if (at-end-of-word)
      (ac-start)
    (indent-for-tab-command)))

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
