(defun eo-mode()
  (ispell-change-dictionary "esperanto")
  (set-input-method 'esperanto-postfix)
  (set-language-environment 'esperanto))