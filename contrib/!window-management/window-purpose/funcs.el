;; (defun spacemacs/set-mode-purpose (mode purpose)
;;   (oset window-purpose-config
;;         :mode-purposes
;;         (append `((,mode . ,purpose))
;;                 (cl-delete mode
;;                            (oref window-purpose-config :mode-purposes)
;;                            :key 'car)))
;;   (purpose-set-extension-configuration :spacemacs window-purpose-config))

;; (defun spacemacs/delete-mode-purpose (mode)
;;   (oset window-purpose-config
;;         :mode-purposes
;;         (cl-delete mode
;;                    (oref window-purpose-config :mode-purposes)
;;                    :key 'car))
;;   (purpose-set-extension-configuration :spacemacs window-purpose-config))

;; (defun spacemacs/set-name-purpose (name purpose)
;;   (oset window-purpose-config
;;         :name-purposes
;;         (append `((,name . ,purpose))
;;                 (cl-delete name
;;                            (oref window-purpose-config :name-purposes)
;;                            :key 'car
;;                            :test 'equal)))
;;   (purpose-set-extension-configuration :spacemacs window-purpose-config))

;; (defun spacemacs/delete-name-purpose (name)
;;   (oset window-purpose-config
;;         :name-purposes
;;         (cl-delete name
;;                    (oref window-purpose-config :name-purposes)
;;                    :key 'car
;;                    :test 'equal))
;;   (purpose-set-extension-configuration :spacemacs window-purpose-config))

;; (defun spacemacs/set-regexp-purpose (regexp purpose)
;;   (oset window-purpose-config
;;         :regexp-purposes
;;         (append `((,regexp . ,purpose))
;;                 (cl-delete regexp
;;                            (oref window-purpose-config :regexp-purposes)
;;                            :key 'car
;;                            :test 'equal)))
;;   (purpose-set-extension-configuration :spacemacs window-purpose-config))

;; (defun spacemacs/delete-regexp-purpose (regexp)
;;   (oset window-purpose-config
;;         :regexp-purposes
;;         (cl-delete regexp
;;                    (oref window-purpose-config :regexp-purposes)
;;                    :key 'car
;;                    :test 'equal))
;;   (purpose-set-extension-configuration :spacemacs window-purpose-config))
