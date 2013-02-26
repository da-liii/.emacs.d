;; Key Map
(define-key global-map "\C-x\C-u" 'undo)
(define-key global-map "\C-h" 'backward-delete-char-untabify)
(global-set-key (kbd "<f5>") 'compile)
(global-set-key [(meta ?/)] 'hippie-expand)

(provide 'init-keymap)
