;; Customizations for making it easier to navigate files, buffers, etc.

;; Use Projectile everywhere
(projectile-global-mode)

;;;;
;; ido customizations
;;;;
(ido-mode t)
(setq ido-enabe-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-use-virtual-buffers t)
(ido-ubiquitous-mode 1)
