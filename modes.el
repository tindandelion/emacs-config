(add-hook 'text-mode-hook 
	  '(lambda ()
	     (setq fill-column 80)
	     (turn-on-auto-fill)))
