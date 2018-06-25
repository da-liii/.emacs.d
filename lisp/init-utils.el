;; backup
(setq version-control t ;; Use version numbers for backups
      kept-new-versions 16 ;; Number of newest versions to keep
      kept-old-versions 2 ;; Number of oldest versions to keep
      delete-old-versions t ;; Ask to delete excess backup versions?
      backup-by-copying-when-linked t) ;; Copy linked files, don't rename.
(defun force-backup-of-buffer ()
  (let ((buffer-backed-up nil))
    (backup-buffer)))
(add-hook 'before-save-hook  'force-backup-of-buffer)

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/auto-save-list"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; Project Tile
(require 'projectile)
(setq projectile-use-git-grep t)
(projectile-global-mode t)

(require 'neotree)
(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))


;; Code Browser
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
;;(setq stack-trace-on-error nil)
;;(require 'ecb)

;;ido
(require 'ido)
(ido-mode t)

(require 'smex)
(smex-initialize)

(provide 'init-utils)
