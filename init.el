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

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(java-mode . ("java" 
                              "-Declipse.application=org.eclipse.jdt.ls.core.id1"
                              "-Dosgi.bundles.defaultStartLevel=4"
                              "-Declipse.product=org.eclipse.jdt.ls.core.product"
                              "-Dlog.level=ALL"
                              "-noverify"
                              "-Xmx1G"
                              "-jar" "./jdtls/plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.1400.v20250331-1702.jar"  ; Путь к JAR
                              "-configuration" "~/.emacs.d/jdtls/config_linux"  ; Для Linux
                              "--add-modules=ALL-SYSTEM"
                              "--add-opens java.base/java.util=ALL-UNNAMED"
                              "--add-opens java.base/java.lang=ALL-UNNAMED"))))

