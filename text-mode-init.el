;; Text-mode customizations

(setq fill-column 80)
(add-hook 'text-mode-hook 
	  '(lambda ()
	     (turn-on-auto-fill)))