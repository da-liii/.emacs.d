(add-to-list 'load-path "~/.emacs.d/lisps/")
;; Default Settings
(prefer-coding-system 'utf-8)
(display-time)
(global-linum-mode)
;;(setq explicit-shell-file-name "/bin/bash")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-tab-always-indent nil)
 '(display-time-mode t)
 ;; '(initial-buffer-choice "~/Documents")
 '(org-agenda-files (quote ("~/todo.org")))
 '(org-agenda-include-diary t)
 '(org-support-shift-select t)
 '(tool-bar-mode nil)
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'c-mode-hook
	  '(lambda ()
	     (c-set-style "K&R")
	     (c-toggle-auto-state)
	     (c-toggle-auto-hungry-state)))

(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")))

(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-offset 4)

(require 'xscheme)
(require 'cedet)
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(semantic-load-enable-gaudy-code-helpers)
(global-semantic-stickyfunc-mode nil)
;;(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)
(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode) ;;gdb调试的时候用来禁用折叠mode


(require 'tabbar)  
(tabbar-mode 1) 
(global-set-key [(meta j)] 'tabbar-backward)  
(global-set-key [(meta k)] 'tabbar-forward) 
;; 设置tabbar外观  
;; 设置默认主题: 字体, 背景和前景颜色，大小  
(set-face-attribute 'tabbar-default nil  
		    :family "DejaVu Sans Mono"  
		    :background "gray80"  
		    :foreground "gray30"  
		    :height 1.0  
		    )  
;; 设置左边按钮外观：外框框边大小和颜色  
(set-face-attribute 'tabbar-button nil  
		    :inherit 'tabbar-default  
		    :box '(:line-width 1 :color "yellow")  
		    )  
;; 设置当前tab外观：颜色，字体，外框大小和颜色  
(set-face-attribute 'tabbar-selected nil  
		    :inherit 'tabbar-default  
		    :foreground "DarkGreen"  
		    :background "LightGoldenrod"  
		    :box '(:line-width 2 :color "DarkGoldenrod")  
		    :overline "black"  
		    :underline "black"  
		    :weight 'bold  
		    )  
;; 设置非当前tab外观：外框大小和颜色  
(set-face-attribute 'tabbar-unselected nil  
		    :inherit 'tabbar-default  
		    :box '(:line-width 2 :color "#00B2BF")  
		    )  

(which-function-mode)

(require 'highlight-symbol)

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

;;(require 'sdcv-mode)
;;(global-set-key (kbd "C-c d") 'sdcv-search)

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)))
(color-theme-calm-forest)

(load "~/.emacs.d/eo-mode.el")

;; Mode
(setq default-major-mode 'visual-line-mode)
;; (setq default-major-mode 'text-mode)
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq auto-mode-alist (cons '("\\.eo$" . eo-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))
(autoload 'php-mode "php-mode.el" "Php mode." t)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(visual-line-mode)
;; org-mode

;; R Emacs Speaks Statistics
;; (load "~/.emacs.d/lisps/ess-12.09/lisp/ess-site")

;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\.md" . markdown-mode) auto-mode-alist))

;; Code Browser
(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
(require 'ecb)

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

;; python
;;(require 'pymacs)
;;(pymacs-load "ropemacs" "rope-")


;; 备份
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
 '(("." . "~/.emacs.d/autosaves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; 键绑定
(load "~/.emacs.d/keymap.el")

;; font
(when (display-graphic-p)
  (defun qiang-font-existsp (font)
    (if (null (x-list-fonts font))
	nil t))

  (defvar font-list '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
  (require 'cl) ;; find-if is in common list package
  (find-if #'qiang-font-existsp font-list)
  (defun qiang-make-font-string (font-name font-size)
    (if (and (stringp font-size) 
	     (equal ":" (string (elt font-size 0))))
	(format "%s%s" font-name font-size)
      (format "%s %s" font-name font-size)))
  (defun qiang-set-font (english-fonts
			 english-font-size
			 chinese-fonts
			 &optional chinese-font-size)
    "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
    (require 'cl)                         ; for find if
    (let ((en-font (qiang-make-font-string
		    (find-if #'qiang-font-existsp english-fonts)
		    english-font-size))
	  (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
			      :size chinese-font-size)))
      
      ;; Set the default English font
      ;; 
      ;; The following 2 method cannot make the font settig work in new frames.
      ;; (set-default-font "Consolas:pixelsize=18")
      ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
      ;; We have to use set-face-attribute
      (message "Set English Font to %s" en-font)
      (set-face-attribute
       'default nil :font en-font)
      
      ;; Set Chinese font 
      ;; Do not use 'unicode charset, it will cause the english font setting invalid
      (message "Set Chinese Font to %s" zh-font)
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
			  charset
			  zh-font))))

  (qiang-set-font
   '("Source Code Pro" "Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=18"
   '("Microsoft Yahei" "WenQuanYi Zen Hei" "黑体" "新宋体" "宋体"))

  (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
  (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

  (require `highlight-tail)
  (setq highlight-tail-colors '(("black" . 0)
				("#2525bc" . 25)
				("black" . 66)))
  (highlight-tail-mode)
  )
