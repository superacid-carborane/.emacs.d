;; Configuration for Org Mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-ca" 'org-agenda)

(setq org-log-done 'time)
