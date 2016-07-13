;;;;
;; Packages
;;;;

;; Define Package Repos
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; Download package archive descriptions
(when (not package-archive-contents)
  (package-refresh-contents))

;; List of packages to install
(defvar my-packages
  '(ido-ubiquitous
    projectile
    magit
    htmlize))

;; Handle OS X Shell inconsistencies
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Handle elisp files
(add-to-list 'load-path "~/.emacs.d/vendor")

;;;;
;; Customizations
;;;;

;; Add customizations directory to our load path
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Set up exec-path-from-shell so that emacs will use the
;; correct environment variables.
(load "shell-integration.el")

;; Navigation
(load "navigation.el")

;; User Interface 
(load "ui.el")

;; Editing
(load "editing.el")

;; General
(load "misc.el")

;; Language-specific
(load "setup-org.el")
(load "setup-c.el")

;; Package Specific Customizations
(load "setup-mu4e.el")
(load "setup-magit.el")

 ;; Terminal buffer configuration.
 (add-hook 'term-mode-hook 'my-term-mode-hook)
 (defun my-term-mode-hook ()
   ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=20611
   (setq bidi-paragraph-direction 'left-to-right))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/org/rob.org" "~/org/eric.org" "~/org/csm.org" "~/org/circle.org" "~/org/docs.org")))
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
