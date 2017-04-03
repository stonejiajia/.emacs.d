(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")


;;scheme geiser
(setq geiser-chez-binary "/usr/local/Cellar/chez-scheme/HEAD-a2a6637/bin/chez")

(setq geiser-active-implementations '(chez))


;;bug fix :Warning (python)
(setq python-shell-completion-native-enable nil)


