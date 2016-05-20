;;; packages.el --- neutralevil Layer packages File for Spacemacs
;;
;; Copyright (c) 2015-2016 Liu Bin
;;
;; Author: Liu Bin <liubin.net@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq neutralevil-packages
    '(
      ;; package names go here
      ;epresent
      nasm-mode
      org-mac-link
      ;quickrun
      ))

;; List of packages to exclude.
(setq neutralevil-excluded-packages '())

;; For each package, define a function neutralevil/init-<package-name>
;;
;; (defun neutralevil/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
(defun neutralevil/init-nasm-mode ()
  (use-package nasm-mode
    :defer t))

(defun neutralevil/init-org-mac-link ()
  (use-package org-mac-link
    :if (spacemacs/system-is-mac)
    :defer t
    :commands org-mac-grab-link
    :init
    (evil-leader/set-key-for-mode 'org-mode
      "mig" 'org-mac-grab-link)
    (add-hook 'org-mode-hook
              (lambda ()
                (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link)))))
