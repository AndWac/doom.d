;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Andreas Wacknitz"
      user-mail-address "w.wacknitz gmx.de")

;; doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 24))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(defun set-frame-size-according-to-resolution ()
    (interactive)
    (if window-system
        (progn
          (if (> (x-display-pixel-width) 1280)
              (add-to-list 'default-frame-alist (cons 'width 120))
            (add-to-list 'default-frame-alist (cons 'width 80)))
          (add-to-list 'default-frame-alist
                      (cons 'height (max 40 (min 38 (/ (- (x-display-pixel-height) 320)))
                                         (frame-char-height)))))))
(set-frame-size-according-to-resolution)

(cond
  ((string-equal system-type "usg-unix-v")
   (progn
     (setq-default tide-tsserver-executable "/export/home/andreas/npm/bin/tsserver")))

  ((string-equal system-type "gnu/linux")
   (progn
     (setq-default tide-tsserver-executable "/home/andreas/npm/bin/tsserver")))

  ((string-equal system-type "darwin")
   (progn
     (setq-default tide-tsserver-executable "/Users/andreas/npm/bin/tsserver")
     ;; set keys for Apple keyboard, for emacs in OS X
     (setq mac-command-modifier 'super)   ; make cmd key do Super
     (setq mac-option-modifier  'meta)    ; make opt key do Meta
     (setq mac-control-modifier 'control) ; make Control key do Control
     ;;(setq ns-function-modifier 'hyper)   ; make Fn key do Hyper
     ;; I am using a German PC keyboard on my Mac so I have to leave the right option undefined in order to get {[]}\@~|²³
     (setq mac-right-option-modifier nil)
     ;; MacOS has bindings for <home> and <end> to *-of-buffer:
     (global-set-key (kbd "<home>") 'beginning-of-line)
     (global-set-key (kbd "C-<home>") 'beginning-of-buffer)
     (global-set-key (kbd "<end>") 'end-of-line)
     (global-set-key (kbd "C-<end>") 'end-of-buffer)))

  ((string-equal system-type "windows-nt")
   (progn
     (setq-default tide-tsserver-executable "c:/Users/andreas/AppData/Roaming/npm/bin/tsserver")
     ;; make PC keyboard's Win key or other to type Super or Hyper, for emacs running on Windows.
     (setq w32-pass-lwindow-to-system nil)
     (setq w32-lwindow-modifier 'super)    ; Left Windows key
     (setq w32-pass-rwindow-to-system nil)
     (setq w32-rwindow-modifier 'super)    ; Right Windows key
     (setq w32-pass-apps-to-system nil)
     (setq w32-apps-modifier 'hyper))))
