;;; packages.el --- C/C++ Layer packages File for Spacemacs
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

;; variables

(defvar c-c++-enable-clang-support nil
  "If non nil Clang related packages and configuration are enabled.")

(spacemacs|defvar-company-backends c-mode-common)
(spacemacs|defvar-company-backends cmake-mode)

(defvar c-c++-default-mode-for-headers 'c-mode
  "Default mode to open header files. Can be `c-mode' or `c++-mode'.")

(defvar c-c++-tags-engine 'gtags
  "Which tags engine to use, when the tags layer is used.
Should be one of gtags or cscope.")
