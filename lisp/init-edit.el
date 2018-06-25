(require 'highlight-symbol)
(global-set-key [f2] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
;        "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
;        "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
;        "/path/to/yasnippet/snippets"         ;; the default collection
        ))

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-yasnippet)

(require 'evil)
(add-hook 'after-init-hook 'evil-mode)
; (add-to-list 'evil-emacs-state-modes 'scala-mode)

;; auto pair
(require 'autopair)
(autopair-global-mode)

;; 自动补齐
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

(provide 'init-edit)
