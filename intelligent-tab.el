(defun intelligent-tab-for-mode (mode-map)
  (define-key mode-map "\t" 'yas/expand)
  (setq yas/fallback-behavior '(apply tab-completion-after-yasnippet)))

(defun at-end-of-word ()
  (and (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after)))))))

(defun tab-completion-after-yasnippet ()
  (interactive)
  (if (at-end-of-word)
      (ac-start)
    (indent-for-tab-command)))
