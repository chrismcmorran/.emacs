(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


; Vim Emulation
(require 'evil)
(evil-mode t)

; Display Line Numbers
(global-linum-mode t)


(require 'sanityinc-solarized-dark-theme)
(setq custom-safe-themes t)
(if (display-graphic-p)
    (load-theme 'sanityinc-solarized-dark)
  (load-theme 'wombat))
; Project Mode

(require 'ede)
(global-ede-mode t)

(require 'semantic)
(semantic-mode t)

(require 'helm-config)

(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET


; Company Mode (Completion)
(require 'company)
(global-company-mode t)
(setq company-minimum-prefix-length 0)
(setq company-idle-delay 0)


(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)


; Company Backends
(require 'company-irony)
 (eval-after-load 'company
   '(add-to-list 'company-backends 'company-irony))
   (require 'company-irony-c-headers)
   ;; Load with `irony-mode` as a grouped backend
   (eval-after-load 'company
     '(add-to-list
       'company-backends '(company-irony-c-headers company-irony)))



(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

; Yasnippet
(require 'yasnippet)
(yas-global-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories
   (quote
    ("/Users/chris/Development/javatest" "/Users/chris/Development/repeat")))
 '(package-selected-packages
   (quote
    (smartparens cpp-auto-include company-emacs-eclim ecb yasnippet evil company-irony-c-headers company-irony color-theme-solarized color-theme-sanityinc-solarized))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
