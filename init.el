;; init.el -- Emacs configuration

;; INSTALL PACKAGES
;; ------------------------------

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(auctex
    auto-complete
    auto-complete-auctex
    better-defaults
    elpy ;; elpy for python development support
    evil ;; evil mode --> vi-keybindings
    flycheck ;; flycheck for syntax checking
    jdee ;; jdee for java development suppport
    material-theme ;; prettify
    org
    py-autopep8)) ;; formatting

(mapc #'(lambda(package)
	  (unless (package-installed-p package)
	  (package-install package)))
      myPackages)


;; BASIC CUSTOMIZATION
;; ------------------------------

(setq inhibit-startup-message t) ;; hides startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; set line numbers globally

(elpy-enable) ;; elpy-mode

;; FLYCHECK
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; autopep8 - correct python
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; BUFFER REFRESHER
(defun revert-buffer-no-confirm ()
  "Revert Buffer Without Confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

;; MUTT
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))

;; AUTOCOMPLETE
;; globally
(require 'auto-complete)
(global-auto-complete-mode t)

;; EVIL-MODE
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; DOC-VIEW
;; through auto-revert
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

;;init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (material-theme better-defaults org melpa-upstream-visit magit jdee goto-last-change autopair auto-complete-auctex auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
