;;;===============
;;;  语法检查
;;;===============

(require-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)


(provide 'jove-flycheck)
