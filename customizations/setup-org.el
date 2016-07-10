;; Configuration for Org Mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-ca" 'org-agenda)

(setq org-log-done 'time)

;; Load ODT backend to allow for exporting to open document format.
(require 'ox-odt)

;;;;
;; Projects
;;;;

;; levlaz.org Blog
(setq org-publish-project-alist
      '(("levlaz"
         ;; Path to org files.
         :base-directory "~/git/levlaz.org/_org"
         :base-extension "org"

         ;; Path to Jekyll Posts
         :publishing-directory "~/git/levlaz.org/_posts/2016/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t
         )))
