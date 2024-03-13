(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(require 'org)

(org-babel-load-file (concat user-emacs-directory "configuration-new.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a242356ae1aebe9f633974c0c29b10f3e00ec2bc96a61ff2cdad5ffa4264996d" "3cbfdfce26469ddf69164b28d07852cc0f09a7b4b14d25ca40b34369db7e1664" "c9585af2af11b6fddbb5c3cc723b81033a99620c1e6f5b05915b65e10adbf0d0" "88cb0f9c0c11dbb4c26a628d35eb9239d1cf580cfd28e332e654e7f58b4e721b" "9f1d0627e756e58e0263fe3f00b16d8f7b2aca0882faacdc20ddd56a95acb7c2" "7397cc72938446348521d8061d3f2e288165f65a2dbb6366bb666224de2629bb" default))
 '(vue-html-extra-indent 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
