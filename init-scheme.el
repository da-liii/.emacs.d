(require 'highlight-parentheses)
(add-hook 'scheme-mode-hook 'highlight-parentheses-mode)

(require 'paredit)
(add-hook 'scheme-mode-hook 'paredit-mode)

(provide 'init-scheme)
(defun maybe-map-paredit-newline ()
  (unless (or (memq major-mode '(inferior-emacs-lisp-mode nrepl-mode))
              (minibufferp))
    (local-set-key (kbd "RET") 'paredit-newline)))
(add-hook 'paredit-mode-hook 'maybe-map-paredit-newline)
(require 'xscheme)
