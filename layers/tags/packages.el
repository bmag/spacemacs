;;; packages.el --- tags Layer packages File for Spacemacs
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

(setq tags-packages
      '(
        ;; gtags
        helm-gtags
        ggtags

        ;; cscope

        ;; general
        ;; evil-jumper, evil-set-jump
        ;; imenu
        ;; eldoc
        ;; company
        ))

(setq tags-excluded-packages '())

(defun tags/init-helm-gtags ()
  (use-package helm-gtags
    :defer t
    :init
    (progn
      (setq helm-gtags-ignore-case t
            helm-gtags-auto-update t
            helm-gtags-use-input-at-cursor t
            helm-gtags-pulse-at-cursor t))

    :config
    (progn
      ;; if anyone uses helm-gtags, they would want to use these key bindings
      (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
      (define-key helm-gtags-mode-map (kbd "C-x 4 .") 'helm-gtags-find-tag-other-window)
      (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
      (define-key helm-gtags-mode-map (kbd "M-*") 'helm-gtags-pop-stack)

      ;; integration with evil-jumper
      (when (configuration-layer/package-usedp 'evil-jumper)
        (defadvice helm-gtags--action-openfile (before add-evil-jump activate)
          (evil-set-jump))))))

(defun tags/init-ggtags ()
  (use-package ggtags
    :defer t))
