;;; nerd-the-icons-ivy-rich.el --- Better experience with icons for ivy        -*- lexical-binding: t; -*-

;; Copyright (C) Wizard962 <smatyfei@gmail.com>

;; Author: Wizard962 <smatyfei@gmail.com>
;; Homepage: https://github.com/wizard962/nerd-icons-ivy-rich.el
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.4") (ivy-rich "0.1.0") (all-the-icons "2.2.0"))
;; Keywords: convenience, icons, ivy

;; This file is not part of GNU Emacs.

;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

;;; Commentary:

;; Better experience with icons for ivy.
;;
;; Install:
;; From melpa, `M-x package-install RET nerd-the-icons-ivy-rich RET`.
;; (nerd-the-icons-ivy-rich-mode 1)
;; or
;; (use-package nerd-the-icons-ivy-rich-mode
;;   :ensure t
;;   :init (nerd-the-icons-ivy-rich-mode 1))


;;; Code:

(eval-when-compile (require 'bookmark))

(require 'subr-x)
(require 'ivy-rich)
(require 'nerd-icons)

(defgroup nerd-icons-ivy-rich nil
  "Better experience with icons for ivy."
  :group 'nerd-icons
  :group 'ivy-rich
  :link '(url-link :tag "Homepage" "https://github.com/seagle0128/all-the-icons-ivy-rich"))

(defcustom nerd-icons-ivy-rich-display-transformers-list
  '(ivy-switch-buffer
    (:columns
     ((nerd-icons-ivy-rich-buffer-icon)
      (ivy-rich-candidate (:width 30))
      (ivy-rich-switch-buffer-size (:width 7))
      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
      (ivy-rich-switch-buffer-project (:width 15 :face success))
      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
     :predicate
     (lambda (cand) (get-buffer cand))
     :delimiter "\t")
    ivy-switch-buffer-other-window
    (:columns
     ((nerd-icons-ivy-rich-buffer-icon)
      (ivy-rich-candidate (:width 30))
      (ivy-rich-switch-buffer-size (:width 7))
      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
      (ivy-rich-switch-buffer-project (:width 15 :face success))
      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
     :predicate
     (lambda (cand) (get-buffer cand))
     :delimiter "\t")
    counsel-switch-buffer
    (:columns
     ((nerd-icons-ivy-rich-buffer-icon)
      (ivy-rich-candidate (:width 30))
      (ivy-rich-switch-buffer-size (:width 7))
      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
      (ivy-rich-switch-buffer-project (:width 15 :face success))
      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
     :predicate
     (lambda (cand) (get-buffer cand))
     :delimiter "\t")
    counsel-switch-buffer-other-window
    (:columns
     ((nerd-icons-ivy-rich-buffer-icon)
      (ivy-rich-candidate (:width 30))
      (ivy-rich-switch-buffer-size (:width 7))
      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
      (ivy-rich-switch-buffer-project (:width 15 :face success))
      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
     :predicate
     (lambda (cand) (get-buffer cand))
     :delimiter "\t")
    persp-switch-to-buffer
    (:columns
     ((nerd-icons-ivy-rich-buffer-icon)
      (ivy-rich-candidate (:width 30))
      (ivy-rich-switch-buffer-size (:width 7))
      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
      (ivy-rich-switch-buffer-project (:width 15 :face success))
      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
     :predicate
     (lambda (cand) (get-buffer cand))
     :delimiter "\t")
    counsel-M-x
    (:columns
     ((nerd-icons-ivy-rich-function-icon)
      (counsel-M-x-transformer (:width 50))
      (ivy-rich-counsel-function-docstring (:face font-lock-doc-face))))
    counsel-describe-function
    (:columns
     ((nerd-icons-ivy-rich-function-icon)
      (counsel-describe-function-transformer (:width 50))
      (ivy-rich-counsel-function-docstring (:face font-lock-doc-face))))
    counsel-describe-variable
    (:columns
     ((nerd-icons-ivy-rich-variable-icon)
      (counsel-describe-variable-transformer (:width 50))
      (ivy-rich-counsel-variable-docstring (:face font-lock-doc-face))))
    counsel-set-variable
    (:columns
     ((nerd-icons-ivy-rich-variable-icon)
      (counsel-describe-variable-transformer (:width 50))
      (ivy-rich-counsel-variable-docstring (:face font-lock-doc-face))))
    counsel-apropos
    (:columns
     ((nerd-icons-ivy-rich-symbol-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-info-lookup-symbol
    (:columns
     ((nerd-icons-ivy-rich-symbol-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-descbinds
    (:columns
     ((nerd-icons-ivy-rich-keybinding-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-find-file
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (ivy-read-file-transformer))
     :delimiter "\t")
    counsel-file-jump
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-dired
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (ivy-read-file-transformer))
     :delimiter "\t")
    counsel-dired-jump
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-el
    (:columns
     ((nerd-icons-ivy-rich-symbol-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-fzf
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-git
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-recentf
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (ivy-rich-candidate (:width 0.8))
      (ivy-rich-file-last-modified-time (:face font-lock-comment-face)))
     :delimiter "\t")
    counsel-buffer-or-recentf
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (counsel-buffer-or-recentf-transformer (:width 0.8))
      (ivy-rich-file-last-modified-time (:face font-lock-comment-face)))
     :delimiter "\t")
    counsel-bookmark
    (:columns
     ((ivy-rich-bookmark-type)
      (nerd-icons-ivy-rich-bookmark-name (:width 40))
      (ivy-rich-bookmark-info))
     :delimiter "\t")
    counsel-bookmarked-directory
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-package
    (:columns
     ((nerd-icons-ivy-rich-package-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-fonts
    (:columns
     ((nerd-icons-ivy-rich-font-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-major
    (:columns
     ((nerd-icons-ivy-rich-function-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-find-library
    (:columns
     ((nerd-icons-ivy-rich-library-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-load-library
    (:columns
     ((nerd-icons-ivy-rich-library-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-load-theme
    (:columns
     ((nerd-icons-ivy-rich-theme-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-world-clock
    (:columns
     ((nerd-icons-ivy-rich-world-clock-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-tramp
    (:columns
     ((nerd-icons-ivy-rich-tramp-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-git-checkout
    (:columns
     ((nerd-icons-ivy-rich-git-branch-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-list-processes
    (:columns
     ((nerd-icons-ivy-rich-process-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-projectile-switch-project
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-projectile-find-file
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (counsel-projectile-find-file-transformer))
     :delimiter "\t")
    counsel-projectile-find-dir
    (:columns
     ((nerd-icons-ivy-rich-project-icon)
      (counsel-projectile-find-dir-transformer))
     :delimiter "\t")
    counsel-minor
    (:columns
     ((nerd-icons-ivy-rich-mode-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    counsel-imenu
    (:columns
     ((nerd-icons-ivy-rich-imenu-icon)
      (ivy-rich-candidate))
     :delimiter "\t")
    treemacs-projectile
    (:columns
     ((nerd-icons-ivy-rich-file-icon)
      (ivy-rich-candidate))
     :delimiter "\t"))
  "Definitions for ivy-rich transformers.

See `ivy-rich-display-transformers-list' for details."
  :group 'nerd-icons-ivy-rich
  :type '(repeat sexp))



(defun nerd-icons-ivy-rich--align-icons ()
  "Setting tab size to 1, to insert tabs as delimiters."
  (setq tab-width 1))

(defun nerd-icons-ivy-rich-bookmark-name (candidate)
  "Return bookmark name from CANDIDATE."
  (car (assoc candidate bookmark-alist)))

(defun nerd-icons-ivy-rich-buffer-icon (candidate)
  "Display buffer icon from CANDIDATE in `ivy-rich'."
  (let* ((buffer (get-buffer candidate))
         (buffer-file-name (buffer-file-name buffer))
         (major-mode (buffer-local-value 'major-mode buffer))
         (icon (with-current-buffer buffer (nerd-icons-icon-for-buffer))))
    (if (symbolp icon)
        (nerd-icons-faicon "file-o" :face 'nerd-icons-dsilver :height 0.8 :v-adjust 0.0)
      icon)))

(defun nerd-icons-ivy-rich-file-icon (candidate)
  "Display file icon from CANDIDATE in `ivy-rich'."
  (let* ((path (concat ivy--directory candidate))
         (file (file-name-nondirectory path))
         (icon (cond
                ((file-directory-p path)
                 (nerd-icons-icon-for-dir path nil ""))
                ((string-match "^/.*:$" path)
                 (nerd-icons-octicon "radio-tower" :height 1.0 :v-adjust 0.01))
                ((not (string-empty-p file))
                 (nerd-icons-icon-for-file file :v-adjust -0.05)))))
    (if (symbolp icon)
        (nerd-icons-faicon "file-o" :face 'nerd-icons-dsilver :height 0.8 :v-adjust 0.0)
      icon)))

(defun nerd-icons-ivy-rich-project-icon (_candidate)
  "Display project icon in `ivy-rich'."
  (nerd-icons-octicon "file-directory" :height 1.0 :v-adjust 0.01))

(defun nerd-icons-ivy-rich-mode-icon (_candidate)
  "Display mode icon in `ivy-rich'."
  (nerd-icons-faicon "cube" :height 0.95 :v-adjust -0.05 :face 'nerd-icons-blue))

(defun nerd-icons-ivy-rich-function-icon (_candidate)
  "Display function icon in `ivy-rich'."
  (nerd-icons-faicon "cube" :height 0.95 :v-adjust -0.05 :face 'nerd-icons-purple))

(defun nerd-icons-ivy-rich-variable-icon (_candidate)
  "Display the variable icon in `ivy-rich'."
  (nerd-icons-octicon "tag" :height 0.95 :v-adjust 0 :face 'nerd-icons-lblue))

(defun nerd-icons-ivy-rich-symbol-icon (_candidate)
  "Display the symbol icon in `ivy-rich'."
  (nerd-icons-octicon "gear" :height 0.9 :v-adjust -0.05))

(defun nerd-icons-ivy-rich-theme-icon (_candidate)
  "Display the theme icon in `ivy-rich'."
  (nerd-icons-material "palette" :height 1.0 :v-adjust -0.2))

(defun nerd-icons-ivy-rich-keybinding-icon (_candidate)
  "Display the keybindings icon in `ivy-rich'."
  (nerd-icons-material "keyboard" :height 0.9 :v-adjust -0.15))

(defun nerd-icons-ivy-rich-library-icon (_candidate)
  "Display the library icon in `ivy-rich'."
  (nerd-icons-material "view_module" :height 1.0 :v-adjust -0.225 :face 'nerd-icons-lblue))

(defun nerd-icons-ivy-rich-package-icon (_candidate)
  "Display the package icon in `ivy-rich'."
  (nerd-icons-faicon "archive" :height 0.9 :v-adjust -0.05 :face 'nerd-icons-silver))

(defun nerd-icons-ivy-rich-font-icon (_candidate)
  "Display the font icon in `ivy-rich'."
  (nerd-icons-faicon "font" :height 0.85 :v-adjust -0.05 :face 'nerd-icons-lblue))

(defun nerd-icons-ivy-rich-world-clock-icon (_candidate)
  "Display the world clock icon in `ivy-rich'."
  (nerd-icons-faicon "globe" :height 0.9 :v-adjust -0.05 :face 'nerd-icons-lblue))

(defun nerd-icons-ivy-rich-tramp-icon (_candidate)
  "Display the tramp icon in `ivy-rich'."
  (nerd-icons-octicon "radio-tower" :height 0.9 :v-adjust 0.01))

(defun nerd-icons-ivy-rich-git-branch-icon (_candidate)
  "Display the git branch icon in `ivy-rich'."
  (nerd-icons-octicon "git-branch" :height 1.0 :v-adjust -0.05 :face 'nerd-icons-green))

(defun nerd-icons-ivy-rich-process-icon (_candidate)
  "Display the process icon in `ivy-rich'."
  (nerd-icons-faicon "bolt" :height 1.0 :v-adjust -0.05 :face 'nerd-icons-lblue))

(defun nerd-icons-ivy-rich-imenu-icon (candidate)
  "Display the imenu icon from CANDIDATE in `ivy-rich'."
  (let ((case-fold-search nil))
    (cond
     ((string-match-p "Type Parameters?[:)]" candidate)
      (nerd-icons-faicon "arrows" :height 0.85 :v-adjust -0.05))
     ((string-match-p "\\(Variables?\\)\\|\\(Fields?\\)\\|\\(Parameters?\\)[:)]" candidate)
      (nerd-icons-octicon "tag" :height 0.95 :v-adjust 0 :face 'nerd-icons-lblue))
     ((string-match-p "Constants?[:)]" candidate)
      (nerd-icons-faicon "square-o" :height 0.95 :v-adjust -0.15))
     ((string-match-p "Enum\\(erations?\\)?[:)]" candidate)
      (nerd-icons-material "storage" :height 0.95 :v-adjust -0.2 :face 'nerd-icons-orange))
     ((string-match-p "References?[:)]" candidate)
      (nerd-icons-material "collections_bookmark" :height 0.95 :v-adjust -0.2))
     ((string-match-p "\\(Types?\\)\\|\\(Property\\)[:)]" candidate)
      (nerd-icons-faicon "wrench" :height 0.9 :v-adjust -0.05))
     ((string-match-p "\\(Functions?\\)\\|\\(Methods?\\)\\|\\(Constructors?\\)[:)]" candidate)
      (nerd-icons-faicon "cube" :height 0.95 :v-adjust -0.05 :face 'nerd-icons-purple))
     ((string-match-p "\\(Class\\)\\|\\(Structs?\\)[:)]" candidate)
      (nerd-icons-faicon "database" :height 0.9 :v-adjust -0.15 :face 'nerd-icons-orange))
     ((string-match-p "Interfaces?[:)]" candidate)
      (nerd-icons-material "share" :height 0.95 :v-adjust -0.2 :face 'nerd-icons-lblue))
     ((string-match-p "Modules?[:)]" candidate)
      (nerd-icons-material "view_module" :height 0.95 :v-adjust -0.15 :face 'nerd-icons-lblue))
     ((string-match-p "Packages?[:)]" candidate)
      (nerd-icons-faicon "archive" :height 0.9 :v-adjust -0.05 :face 'nerd-icons-silver))
     (t (nerd-icons-material "flag" :height 0.9 :v-adjust -0.125)))))

(defun nerd-icons-ivy-rich-bookmark-type (candidate)
  "Return bookmark type from CANDIDATE."
  (let ((filename (ivy-rich-bookmark-filename candidate)))
    (cond ((null filename)
           (nerd-icons-material "block" :height 1.0 :v-adjust -0.2 :face 'warning))  ; fixed #38
          ((file-remote-p filename)
           (nerd-icons-octicon "radio-tower" :height 0.9 :v-adjust 0.01))
          ((not (file-exists-p filename))
           (nerd-icons-material "block" :height 1.0 :v-adjust -0.2 :face 'error))
          ((file-directory-p filename)
           (nerd-icons-octicon "file-directory" :height 0.9 :v-adjust -0.05))
          (t (nerd-icons-icon-for-file (file-name-nondirectory filename) :height 0.9 :v-adjust -0.05)))))

(defvar nerd-icons-ivy-rich-display-transformers-old-list ivy-rich-display-transformers-list)

;;;###autoload
(define-minor-mode nerd-icons-ivy-rich-mode
  "Better experience with icons for ivy."
  :lighter nil
  :global t
  (if nerd-icons-ivy-rich-mode
      (progn
        (add-hook 'minibuffer-setup-hook #'nerd-icons-ivy-rich--align-icons)
        (advice-add #'ivy-rich-bookmark-type :override #'nerd-icons-ivy-rich-bookmark-type)
        (setq ivy-rich-display-transformers-list nerd-icons-ivy-rich-display-transformers-list))
    (progn
      (remove-hook 'minibuffer-setup-hook #'nerd-icons-ivy-rich--align-icons)
      (advice-remove #'ivy-rich-bookmark-type #'nerd-icons-ivy-rich-bookmark-type)
      (setq ivy-rich-display-transformers-list nerd-icons-ivy-rich-display-transformers-old-list)))
  (ivy-rich-reload))

(provide 'nerd-icons-ivy-rich)

;;; nerd-icons-ivy-rich.el ends here
