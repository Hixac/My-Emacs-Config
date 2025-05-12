
(defvar my/org-latex-preview-scale 2.0
  "Current scale for org-latex-preview")

(defun my/org-latex-preview-set-scale (scale)
  "Set latex preview SCALE and refresh previews."
  (interactive "nNew LaTeX preview scale: ")
  (setq my/org-latex-preview-scale scale)
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale scale))
  (org-clear-latex-preview)
  (org-latex-preview))

(defun my/org-latex-preview-decrease-scale ()
  "Decrease LaTeX preview scale."
  (interactive)
  (my/org-latex-preview-set-scale (max 0.5 (- my/org-latex-preview-scale 0.2))))

(defun my/org-latex-preview-increase-scale ()
  "Increase LaTeX preview scale."
  (interactive)
  (my/org-latex-preview-set-scale (+ my/org-latex-preview-scale 0.2)))

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c p") #'my/org-latex-preview-increase-scale)
  (define-key org-mode-map (kbd "C-c m") #'my/org-latex-preview-decrease-scale))

;; (with-eval-after-load 'org
;;   (setq org-format-latex-options
;;         (plist-put org-format-latex-options :scale my/org-latex-preview-scale)))
