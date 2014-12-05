(require 'highlight-symbol)
(global-set-key [f2] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

;; yasnippet
(require 'yasnippet)
(yas/global-mode 1)
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)

;; auto complete
(add-to-list 'load-path "~/.emacs.d/lisp/complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; 列表中通过按M-n来向下移动
(define-key ac-completing-map "\M-p" 'ac-previous)

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
