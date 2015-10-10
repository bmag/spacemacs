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
        helm-cscope
        xcscope

        ;; general
        ;; evil-jumper, evil-set-jump
        ;; imenu
        ;; eldoc
        ;; company
        ))

(setq tags-excluded-packages '())

;;; gtags

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

;;; cscope

(defun tags/init-helm-cscope ()
  (use-package helm-cscope
    :defer t))

(defun cscope/init-xcscope ()
  (use-package xcscope
    :commands (cscope-index-files tags/run-pycscope)
    :init
    (progn
      ;; for python projects, we don't want xcscope to rebuild the databse,
      ;; because it uses cscope instead of pycscope
      (setq cscope-option-do-not-update-database t
            cscope-display-cscope-buffer nil)

      (defun tags//safe-project-root ()
        "Return project's root, or nil if not in a project."
        (and (fboundp 'projectile-project-root)
             (projectile-project-p)
             (projectile-project-root)))

      (defun tags/run-pycscope (directory)
        (interactive (list (file-name-as-directory
                            (read-directory-name "Run pycscope in directory: "
                                                 (tags//safe-project-root)))))
        (let ((default-directory directory))
          (shell-command
           (format "pycscope -R -f '%s'"
                   (expand-file-name "cscope.out" directory))))))
      :config
      (when (configuration-layer/package-usedp 'evil-jumper)
        (defadvice helm-cscope-find-this-symbol (before add-evil-jump activate)
          (evil-set-jump)))))
