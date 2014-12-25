(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook
          '(lambda ()
             (global-set-key (kbd "M-,") 'jedi:goto-definition)))

(provide 'init-python)
