;; Use MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Turn on Vim Keybindings
(require 'evil)
(evil-mode 1)

;; Show Line Numbers
(global-linum-mode 1)
(setq linum-format "%d ") ;; Adds a single space between the line numbers and the buffer. 

;; Highlight the Matching Brace
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Enable Auto-Complete
;;(require 'auto-complete)
;;(auto-complete-mode 1)
;;(ac-config-default)

;; Enable Yasnippet
(require 'yasnippet)
(yas-global-mode 1)


;; === COMPANY MODE ===
(require 'company)
(global-company-mode 1)
(add-hook 'global-init-hook 'global-company-mode)  ;; Enables company mode in all buffers.
(add-to-list 'company-backends 'company-c-headers) ;; Enables C header lookup in C-mode.
(push 'company-rtags company-backends)             ;; Adds rtags as a company backend.
;;(global-set-key "\t" 'company-complete-common)     ;; Tab invokes completions.
(setq company-idle-delay 0)                        ;; Always complete everything.
(setq company-minimum-prefix-length 1)             ;; Start completing after 1 character is typed.

;; RTags Support
;; Start RTags if it is not running.
(setq rtags-path "/usr/local/Cellar/rtags/2.3_1/bin")
(rtags-start-process-unless-running)
;; Start RTags in C/C++ mode.
(add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)
(setq rtags-autostart-diagnostics t) ;; Start diagnostics
(setq rtags-completions-enabled t)   ;; Enable completions
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages
   (quote
    (define-word spotify helm-spotify ansi jabber srefactor iedit swift-mode xcode-mode flycheck-tip flycheck-pos-tip flycheck company-quickhelp slime ## theme-changer use-package stickyfunc-enhance sr-speedbar smartparens slack scheme-complete rtags project-explorer pcmpl-args ggtags folding flyspell-popup flyspell-correct-popup flymake-google-cpplint flycheck-swift flycheck-google-cpplint evil emms cpputils-cmake company-c-headers cmake-ide clippy buffer-move bongo ampc ac-helm ac-clang)))
 '(send-mail-function (quote sendmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:background "black" :foreground "magenta"))))
 '(company-tooltip ((t (:background "black" :foreground "cyan"))))
 '(company-tooltip-selection ((t (:background "green")))))


;; Set mode based on file extension.
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

(defun my-add-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          ("->" . 8594)    ; →
          ("=>" . 8658)    ; ⇒
          ("map" . 8614)   ; ↦
          )))

(add-hook 'clojure-mode-hook 'my-add-pretty-lambda)
(add-hook 'haskell-mode-hook 'my-add-pretty-lambda)
(add-hook 'shen-mode-hook 'my-add-pretty-lambda)
(add-hook 'tex-mode-hook 'my-add-pretty-lambda)
(add-hook 'scheme-mode-hook 'my-add-pretty-lambda)
(global-prettify-symbols-mode 1)


;; Flycheck popup
(require 'flycheck)
(global-flycheck-mode 1)
(require 'flycheck-tip)
(setq flycheck-display-errors-function 'ignore)
(setq flycheck-display-errors-delay 0)


;; Enable iMessage
(add-to-list 'load-path "~/.emacs.d/imessage")
(add-to-list 'load-path "~/.emacs.d/s")
(require 's)
(require 'imessage)
;; iMessage should be enabled by default

(setq tab-width 4); tabs should use 4 spaces.

