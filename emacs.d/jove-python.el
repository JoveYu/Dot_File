;;;================
;;;   PYTHON配置
;;;================

(require-package 'jedi)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:server-command
      '("python2" "/home/jove/.emacs.d/elpa/jedi-20130714.1415/jediepcserver.py"))

(provide 'jove-python)
