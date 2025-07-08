;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(use-package emacs
  :init
  (setq initial-scratch-message nil
        inhibit-splash-screen t
        make-backup-files nil
        tramp-allow-unsafe-temporary-files t
        garbage-collection-messages t)

  (setq-default indent-tabs-mode nil)

  (load-theme 'modus-vivendi t)

  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)

  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  (add-to-list 'default-frame-alist '(internal-border-width . 4))

  :hook ((after-init . global-prettify-symbols-mode)
         (after-init . fido-vertical-mode)))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

(use-package magit
  :ensure t)

(use-package vterm
  :ensure t
  :config (setq vterm-timer-delay 0.01)
  :commands vterm)

(use-package which-key
  :hook (after-init . which-key-mode))

(use-package cc-mode
  :hook ((c-mode-common . (lambda ()
                            (c-set-style "k&r")
                            (setq c-basic-offset 2)))
         (c-mode-common . eglot-ensure)))

(use-package org
  :config
  (defun org/faces ()
    (set-face-attribute 'org-document-title nil :height 1.5)
    (set-face-attribute 'org-level-1 nil :height 1.25)
    (set-face-attribute 'org-level-2 nil :height 1.10))
  :hook (org-mode . org/faces))
