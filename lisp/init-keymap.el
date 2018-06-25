;; Key Map
(global-set-key [(ctrl =)] 'replace-string)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-[") 'undo)
(define-key global-map "\C-h" 'backward-delete-char-untabify)
(global-set-key (kbd "<f8>") 'compile)
(global-set-key [(meta ?/)] 'hippie-expand)
(global-set-key (kbd "<f10>") 'rename-buffer)
(global-set-key (kbd "<f7>") 'minimap-mode)
(define-key key-translation-map [?\C-h] [?\C-?])

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; yasnippet
(global-set-key (kbd "C-\\") 'yas/expand)

;; evil
(define-key evil-normal-state-map (kbd "M-.") 'ensime-edit-definition)
(define-key evil-normal-state-map "K" 'ensime-type-at-point)

;; Project Tile
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "pf" 'projectile-find-file)
(evil-leader/set-key "pg" 'projectile-grep)
(evil-leader/set-key "pt" 'neotree-project-dir)

;; tabbar 
(global-set-key (kbd "<M-right>") 'tabbar-ruler-forward)
(global-set-key (kbd "<M-left>") 'tabbar-ruler-backward)

(add-hook 'paredit-everywhere-mode-hook
          '(lambda ()
             (define-key paredit-everywhere-mode-map
               (kbd "C-k") 'paredit-kill)))

(provide 'init-keymap)
