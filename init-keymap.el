;; Key Map
(define-key global-map "\C-x\C-u" 'undo)
(define-key global-map "\C-h" 'backward-delete-char-untabify)
(global-set-key (kbd "<f5>") 'compile)
(global-set-key [(meta ?/)] 'hippie-expand)
(global-set-key (kbd "<f10>") 'rename-buffer)
(define-key key-translation-map [?\C-h] [?\C-?]) 

(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down) 

;; yasnippet
(global-set-key (kbd "C-\\") 'yas/expand)

;; gtags
(global-set-key (kbd "M-,") 'gtags-find-tag-from-here)

(provide 'init-keymap)
