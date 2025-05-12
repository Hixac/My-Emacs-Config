(add-to-list 'completion-styles 'initials t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq create-lockfiles nil)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
)

(setq tab-always-indent 'complete)

(setq inhibit-startup-screen t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

; (global-display-line-numbers-mode)

(setq dired-listing-switches "-vaBhl  --group-directories-first")

(setq auto-hscroll-mode nil)
(setq dired-dwim-target t)

(defun mode-line-buffer-file-parent-directory ()
  (when buffer-file-name
    (concat "[" (directory-file-name (file-name-directory buffer-file-name)) "]")))
(setq-default mode-line-buffer-identification
			  (cons (car mode-line-buffer-identification) '((:eval (mode-line-buffer-file-parent-directory)))))

(setq-default c-indent-tabs-mode t     ; Pressing TAB should cause indentation
              c-indent-level 4         ; A TAB is equivilent to four spaces
              c-argdecl-indent 0       ; Do not indent argument decl's extra
              c-tab-always-indent t
              backward-delete-function nil) ; DO NOT expand tabs when deleting
(c-add-style "my-c-style" '((c-continued-statement-offset 4))) ; If a statement continues on the next line, indent the continuation by 4
(defun my-c-mode-hook ()
  (c-set-style "my-c-style")
  (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
  (c-set-offset 'inline-open '0)
  (c-set-offset 'block-open '0)
  (c-set-offset 'brace-list-open '0)   ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'case-label '0))       ; indent case labels by c-indent-level, too

(setq eglot-ignored-server-capabilities '(:documentOnTypeFormattingProvider))

(setq org-hide-emphasis-markers t)
(global-auto-revert-mode 1)

(setq-default mode-line-format nil)
