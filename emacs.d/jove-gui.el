;;;=============
;;;  界面设置
;;;=============

;;; 最爱的主题
(require-package 'color-theme-solarized)
(load-theme 'solarized-dark t)
;(require-package 'zenburn-theme)
;(load-theme 'zenburn t)

;;; 字体
(set-default-font "Monaco-11")

;;; 放大缩小字体
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(menu-bar-mode -1) ;禁用菜单栏
(tool-bar-mode -1) ;禁用工具栏
(scroll-bar-mode -1) ;禁用滚动条

(setq inhibit-startup-screen t) ; 禁用开始屏

;;; 全屏
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
    (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'toggle-fullscreen)
;; 开启时自动全屏
;(toggle-fullscreen)

;;; 滚动条
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
      
;;; mode条设置
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(delete 'win:mode-string global-mode-string) ;在 `global-mode-string' 中去掉窗口数字

;;; 高亮当前行
(global-hl-line-mode +1)

(provide 'jove-gui)
