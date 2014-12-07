(require 'rainbow-delimiters)
(require 'paredit)
(setq auto-mode-alist
      (cons '("\\.\\(scm\\|rkt\\)\\'" . scheme-mode) auto-mode-alist))

(add-hook 'scheme-mode-hook 'paredit-mode)
(add-hook 'scheme-mode-hook 'fci-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

(global-set-key (kbd "M-(") 'paredit-wrap-round)
(global-set-key (kbd "M-\"") 'paredit-meta-doublequote)
(global-set-key (kbd "C-(") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "C-{") 'paredit-forward-barf-sexp)
(global-set-key (kbd "C-M-p") 'paredit-backward-down)
(global-set-key (kbd "C-M-n") 'paredit-forward-up)

(defun scheme-add-keywords (face-name keyword-rules)
  (let* ((keyword-list (mapcar #'(lambda (x)
                                   (symbol-name (cdr x)))
                               keyword-rules))
         (keyword-regexp (concat "(\\("
                                 (regexp-opt keyword-list)
                                 "\\)[ \n]")))
    (font-lock-add-keywords 'scheme-mode
                            `((,keyword-regexp 1 ',face-name))))
  (mapc #'(lambda (x)
            (put (cdr x)
                 'scheme-indent-function
                 (car x)))
        keyword-rules))

(scheme-add-keywords
 'font-lock-keyword-face
 '((1 . plugin-configure)
   (1 . when)
   (1 . with)
   (1 . tm-define)
   (1 . tmfs-title-handler)
   (1 . tmfs-load-handler)
   (1 . tmfs-format-handler)))

(defun maybe-map-paredit-newline ()
  (unless (or (memq major-mode '(inferior-emacs-lisp-mode nrepl-mode))
              (minibufferp))
    (local-set-key (kbd "RET") 'paredit-newline)))
(add-hook 'paredit-mode-hook 'maybe-map-paredit-newline)
(require 'xscheme)

(provide 'init-scheme)
