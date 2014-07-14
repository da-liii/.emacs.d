(add-hook 'term-mode-hook 
          '(lambda () 
             (setq mode-line-format nil)))

(require 'multi-term)
(setq multi-term-program "/bin/zsh")


(global-set-key (kbd "C-c z") 'multi-term) 
(provide 'init-shell)
