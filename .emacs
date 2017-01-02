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

; Allow any theme to be loaded (unsafe)
(setq custom-safe-themes t)

; Project Mode
(require 'ede)
(global-ede-mode t)

; Load all themes stored in themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(setq ecb-tip-of-the-day nil)
(ecb-activate)


(require 'semantic)
(semantic-mode t)

(require 'helm-config)

(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET
(global-set-key (kbd "M-d") 'dired-at-point)
(global-set-key (kbd "M-l") 'package-list-packages)

; Use Meta-Arrow to move between frames
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)

; Company Mode (Completion)
(require 'company)
(global-company-mode t)
(setq company-minimum-prefix-length 0)
(setq company-idle-delay 0)

(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)


(setq rtags-path "/usr/local/Cellar/rtags/2.7")
(require 'rtags)
(global-set-key (kbd "C-j") 'rtags-find-symbol-at-point)
(global-set-key (kbd "M-j") 'rtags-backward-token)
(global-set-key (kbd "M-r") 'rtags-rename-symbol)


(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

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



; RTags
(rtags-start-process-unless-running)
(add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)
(rtags-restart-process)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 0)
 '(custom-enabled-themes (quote (zweilight)))
 '(debug-on-quit t)
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(ecb-minor-mode-text "")
 '(ecb-options-version "2.50")
 '(ecb-tip-of-the-day nil)
 '(ede-project-directories
   (quote
    ("/Users/chris/Development/javatest" "/Users/chris/Development/repeat")))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(global-company-mode t)
 '(gnus-logo-colors (quote ("#4c8383" "#bababa")))
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")))
 '(package-selected-packages
   (quote
    (company-c-headers alect-themes flycheck-irony flycheck iedit ag smartparens cpp-auto-include company-emacs-eclim ecb yasnippet evil company-irony-c-headers company-irony color-theme-solarized color-theme-sanityinc-solarized))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview-common ((t (:inherit company-preview :foreground "Black"))))
 '(company-tooltip ((t (:background "controlColor"))))
 '(company-tooltip-annotation ((t (:inherit company-tooltip :foreground "keyboardFocusIndicatorColor"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :foreground "Cyan"))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :foreground "White"))))
 '(ecb-default-highlight-face ((t (:background "secondaryLabelColor"))))
 '(ecb-directory-face ((t (:inherit Blue :background "Blue"))))
 '(ecb-source-face ((t (:inherit Blue :background "Blue")))))


(provide '.emacs);;;

