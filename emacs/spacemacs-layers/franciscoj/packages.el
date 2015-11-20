;;; packages.el --- franciscoj Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar franciscoj-packages
  '(yard-mode
    rubocop
    jade-mode
    yaml-mode
    ox-reveal)
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar franciscoj-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function franciscoj/init-<package-franciscoj>
;;
;; (defun franciscoj/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun franciscoj/init-yard-mode ()
  "Initialize yard-mode on Ruby files"
  (use-package yard-mode
    :init (progn
            (add-hook 'enh-ruby-mode-hook 'yard-mode)
            (add-hook 'ruby-mode-hook 'yard-mode))))

(defun franciscoj/init-rubocop ()
  "Initialize rubocop"
  (use-package rubocop))

(defun franciscoj/init-jade-mode ()
  "Initialize jade mode"
  (use-package jade-mode))

(defun franciscoj/init-ox-reveal ()
  "Initialize org reveal"
  (use-package ox-reveal))

(defun franciscoj/init-yaml-mode ()
  "Initialize yaml mode"
  (use-package yaml-mode))
