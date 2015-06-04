;;; packages.el --- window-purpose Layer packages File for Spacemacs
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

(setq window-purpose-packages '(window-purpose
                                imenu-list
                                let-alist))

(setq window-purpose-excluded-packages '())

(defun window-purpose/init-window-purpose ()
  (use-package window-purpose
    :config
    (evil-leader/set-key
      "rb" 'purpose-switch-buffer-with-purpose
      "rd" 'purpose-toggle-window-purpose-dedicated
      "rB" 'spacemacs/helm-mini-ignore-purpose
      "rD" 'purpose-delete-non-dedicated-windows
      "rp" 'purpose-switch-buffer-with-some-purpose
      "rP" 'purpose-set-window-purpose)
    (setq purpose-preferred-prompt 'helm)
    (defalias 'spacemacs/helm-mini-ignore-purpose
      (without-purpose-command #'helm-mini)
      "Same as `helm-mini', but disable window-purpose while this command executes.")

    (purpose-mode)
    (purpose-x-golden-ratio-setup)))
