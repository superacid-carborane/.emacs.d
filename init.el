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

;; User Interface 
(load "ui.el")

;; Editing
(load "editing.el")

;; General
(load "misc.el")

;; Language-specific
(load "setup-org.el")
(load "setup-c.el")
