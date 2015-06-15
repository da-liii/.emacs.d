(require 'elpy)

(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
(add-hook 'python-mode-hook 'elpy-mode)

(provide 'init-python)
