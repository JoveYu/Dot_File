;;;================
;;;   自动补全配置
;;;================
(require-package 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

(setq-default ac-expand-on-auto-complete nil)
;(setq-default ac-auto-start nil) ;禁用自动弹出
(setq-default ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed

(setq ac-auto-start 2) ; 输入2个字符才开始补全

(setq tab-always-indent 'complete)  ;补全时不缩进
(add-to-list 'completion-styles 'initials t)



;; 设置字典
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict")

(ac-config-default)

(provide 'jove-auto-complete)
