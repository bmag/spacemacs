(defun tags/enable-gtags-for-mode (mode)
  (let ((mode-hook (intern (format "%s-hook" mode)))
        (mode-map (intern (format "%s-map" mode))))
    (tags/define-gtags-keys-for-mode mode)
    (tags/enable-gtags-eldoc-for-mode mode)
    (tags/enable-gtags-company-for-mode mode)
    ))

;; keys:
;; d -> definition
;; r -> referneces
;; f -> dwim goto
;; u -> create/update tags database
;; R -> resume search/helm session
;; l -> location stack (browse visited locations)
;; n -> next location from history
;; p -> previous location from history
(defun tags/define-gtags-keys-for-mode (mode)
  "Define gtags key bindings for MODE.
Also make sure that `helm-gtags-mode' is added to MODE's hook."
  (add-hook (intern (concat (symbol-name mode) "-hook")) #'helm-gtags-mode)
  (evil-leader/set-key-for-mode mode
    ;; search
    "mfd" #'helm-gtags-find-tag
    "mfr" #'helm-gtags-find-rtag
    "mff" #'helm-gtags-dwim

    ;; create/update tags
    "mfu" #'helm-gtags-update-tags
    "mfU" #'helm-gtags-create-tags

    ;; location stack
    "mfl" #'helm-gtags-show-stack
    "mfn" #'helm-gtags-next-history
    "mfp" #'helm-gtags-previous-history))

(defun tags/enable-gtags-eldoc-for-mode (mode)
  "Setup gtags-powered eldoc support for MODE.
Works by adding `tags/enable-gtags-eldoc' to MODE's hook.  This function also
takes care of activating `eldoc-mode' for MODE."
  (add-hook (intern (concat (symbol-name mode) "-hook"))
            #'tags/enable-gtags-eldoc))

(defun tags/enable-gtags-eldoc ()
   "Setup gtags-powered eldoc support for current buffer.
Add this function to other hooks."
  (ggtags-mode)
  (eldoc-mode)
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function))

;; TODO: should we also enable company-mode automatically?
(defun tags/enable-gtags-company-for-mode (mode)
  "Setup gtags-powered company support for MODE>
This is actually a no-op, because `company-mode' support gtags out of the box
via `company-gtags' backend.  Just make sure not to add another company backend
infront of `company-gtags'.")
