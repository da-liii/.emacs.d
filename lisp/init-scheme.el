(require 'paredit)
(setq auto-mode-alist
      (cons '("\\.\\(scm\\|rkt\\)\\'" . scheme-mode) auto-mode-alist))

(add-hook 'scheme-mode-hook 'paredit-mode)

(global-set-key (kbd "M-(") 'paredit-wrap-round)
(global-set-key (kbd "M-\"") 'paredit-meta-doublequote)
(global-set-key (kbd "C-(") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "C-{") 'paredit-forward-barf-sexp)
(global-set-key (kbd "C-M-p") 'paredit-backward-down)
(global-set-key (kbd "C-M-n") 'paredit-forward-up)

(defun maybe-map-paredit-newline ()
  (unless (or (memq major-mode '(inferior-emacs-lisp-mode nrepl-mode))
              (minibufferp))
    (local-set-key (kbd "RET") 'paredit-newline)))
(add-hook 'paredit-mode-hook 'maybe-map-paredit-newline)
(require 'xscheme)

(provide 'init-scheme)
