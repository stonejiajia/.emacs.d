;;; packages.el --- stone-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: 石子佳 <stone20091652@ishikoyotekiMacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `stone-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `stone-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `stone-org/pre-init-PACKAGE' and/or
;;   `stone-org/post-init-PACKAGE' toC customize the package as it is loaded.

;;; Code:

(defconst stone-org-packages
  '()
  )

;;* Babel
;;(add-to-list 'load-path "~/.emacs.d/elpa/ess-20170603.817/lisp")
;;(require 'ess-site)

;;; packages.el ends here
;;; ob-ipython
(package-initialize) (require 'ob-ipython)

(defun ipython-notebook/init-ob-ipython ()
  (use-package ob-ipython
    :defer t
    :init
    (org-babel-do-load-languages 'org-babel-load-languages '((ipython . t)))))




(org-babel-do-load-languages
    'org-babel-load-languages
    `((R . t)
    ;  (python . t)
      (ipython . t)))




(setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block

;;; display/update images in the buffer after I evaluate
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)


(eval-after-load 'org
'(progn
     (add-to-list 'org-structure-template-alist
                  '("rr" "#+BEGIN_SRC R :exports both :results graphics :file ./fig_1?.png\n\n#+END_SRC" "<src lang=\"?\">\n\n</src>"))

     (add-to-list 'org-structure-template-alist
                  '("sr" "#+BEGIN_SRC R :exports both :session \n\n#+END_SRC" "<src lang=\"?\">\n\n</src>"))

     (add-to-list 'org-structure-template-alist
                  '("si" "#+BEGIN_SRC ipython :session :results output  :exports both  \n\n#+END_SRC"))

     (add-to-list 'org-structure-template-alist
                  '("ss" "#+BEGIN_SRC ipython :session :exports both  \n\n#+END_SRC"))

     (add-to-list 'org-structure-template-alist
                  '("sif" "#+BEGIN_SRC ipython :session :exports both :file ./figure/fig_1?.png\n\n#+END_SRC" "<src lang=\"?\">\n\n</src>")
                 )

     ))



(setq org-agenda-files (list "/Users/stone20091652/org-notes/"))

(setq deft-extensions '("org" "md" "txt"))

(setq image-file-name-extensions
   (quote
    ("png" "jpeg" "jpg" "gif" "tiff" "tif" "xbm" "xpm" "pbm" "pgm" "ppm" "pnm" "svg" "pdf" "bmp")))

(setq org-image-actual-width 600)


