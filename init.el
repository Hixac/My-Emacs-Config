(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(setq custom-file "~/.emacs.d/HIXAC/custom.el")
(load custom-file t)

(add-to-list 'load-path "~/.emacs.d/")
(load-file "~/.emacs.d/funcs.el")

(add-to-list 'load-path "~/.emacs.d/HIXAC/")
(load-file "~/.emacs.d/HIXAC/remaps.el")
(load-file "~/.emacs.d/HIXAC/modes.el")
(load-file "~/.emacs.d/HIXAC/hooks.el")
(load-file "~/.emacs.d/HIXAC/sets.el")
(load-file "~/.emacs.d/HIXAC/compile-directory/defun.el")
(load-file "~/.emacs.d/HIXAC/tags-generator/tags.el")

(add-to-list 'default-frame-alist '(font . "Mplus1Code 20"))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode)
                 . ("clangd"
                    "-j=4"
                    "--log=error"
                    "--malloc-trim"
					"--clang-tidy"
					"--completion-style=detailed"
                    "--background-index"
                    "--pch-storage=memory"
                    "--header-insertion=never"
                    "--header-insertion-decorators=0"))))


(add-to-list 'completion-styles 'initials t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-hook 'rust-mode-hook
		  (lambda () (setq indent-tabs-mode nil))
		  (lambda () (prettify-symbols-mode)))

(add-hook 'rust-mode-hook 'eglot-ensure)

(setq zig-format-on-save nil)

(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)
