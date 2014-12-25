;; Key Map
(global-set-key [(ctrl =)] 'replace-string)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-[") 'undo)
(define-key global-map "\C-h" 'backward-delete-char-untabify)
(global-set-key (kbd "<f5>") 'compile)
(global-set-key [(meta ?/)] 'hippie-expand)
(global-set-key (kbd "<f10>") 'rename-buffer)
(global-set-key (kbd "<f7>") 'minimap-mode)
(define-key key-translation-map [?\C-h] [?\C-?]) 

(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down) 

;; yasnippet
(global-set-key (kbd "C-\\") 'yas/expand)

;; gtags
(global-set-key (kbd "M-,") 'gtags-find-tag-from-here)

(define-key ac-mode-map  [(control tab)] 'auto-complete)

(add-hook 'paredit-everywhere-mode-hook
          '(lambda ()
             (define-key paredit-everywhere-mode-map
               (kbd "C-k") 'paredit-kill)))

(provide 'init-keymap)
