(display-time)
(global-linum-mode)
(which-function-mode)

(require 'tabbar)  
(tabbar-mode 1) 
(global-set-key [(meta j)] 'tabbar-forward)  
(global-set-key [(meta k)] 'tabbar-backward) 
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


(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)))
(color-theme-calm-forest)

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

(provide 'init-appearance)
