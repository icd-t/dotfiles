;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Fonts and themes
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 15))
(setq doom-theme 'catppuccin)

;; Line numbers style
(setq display-line-numbers-type t)

;; Org dir
(setq org-directory "~/org/")

;; Modeline setup
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))
(setq doom-modeline-height 30)

;; All the Icons
(when (display-graphic-p)
  (require 'all-the-icons))

;; org-modern
(with-eval-after-load 'org (global-org-modern-mode))

;; Window transparency
(add-to-list 'default-frame-alist '(alpha-background . 100)) ; For all new frames henceforth

;; Change org-agenda directory
(setq org-agenda-files (list "~/org"))

;; org-calendar view
(require 'calfw)
(require 'calfw-org)

;; Copy/paste to/from clipbaord
(when (getenv "WAYLAND_DISPLAY")
  (setq wl-copy-process nil)
  (defun wl-copy (text)
    (setq wl-copy-process (make-process :name "wl-copy"
                                        :buffer nil
                                        :command '("wl-copy" "-f" "-n")
                                        :connection-type 'pipe
                                        :noquery t))
    (process-send-string wl-copy-process text)
    (process-send-eof wl-copy-process))
  (defun wl-paste ()
    (if (and wl-copy-process (process-live-p wl-copy-process))
        nil ; should return nil if we're the current paste owner
      (shell-command-to-string "wl-paste -n | tr -d \r")))
  (setq interprogram-cut-function 'wl-copy)
  (setq interprogram-paste-function 'wl-paste))

;; Nix formater
(require 'nixpkgs-fmt)
