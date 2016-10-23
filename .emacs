(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (stickyfunc-enhance ## company sr-speedbar evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(popup-face ((t (:inherit default :background "black" :foreground "brightcyan"))))
 '(popup-summary-face ((t (:inherit popup-face :foreground "magenta"))))
 '(popup-tip-face ((t (:background "black" :foreground "magenta")))))

;; Enable Vim Bindings

(require 'evil)
(evil-mode 1)


(require 'auto-complete)
(global-auto-complete-mode t)
(ac-config-default)
(setq ac-delay 0.1)

;; Set the theme
(load-theme 'manoj-dark)'

;; Set up ggtags
(require 'setup-ggtags)
(require 'ggtags)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
	      (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; Open a project explorer on C-mode
(add-hook 'c-mode-common-hook 'sr-speedbar-open)


;; Enable Company Mode for completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(require 'cc-mode)
(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

;; Enable header file lookup
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.2.1")

;; Enable CEDET
(load-file (concat user-emacs-directory "/cedet/cedet-devel-load.el"))
(load-file (concat user-emacs-directory "cedet/contrib/cedet-contrib-load.el"))

(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)
(global-semantic-idle-scheduler-mode 1)


;; Set up EDE
(require 'ede)
(global-ede-mode)

(require 'stickyfunc-enhance)
(global-semantic-idle-summary-mode 1)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)


;; Code folding
(add-hook 'c-mode-common-hook   'hs-minor-mode)


(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; Insert parenthesis
    (setq skeleton-pair t)
    (global-set-key "(" 'skeleton-pair-insert-maybe)
    (global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)


;; Enable line numbers
(linum-mode 1)
)
;; Show matching braces
(show-paren-mode 1)
