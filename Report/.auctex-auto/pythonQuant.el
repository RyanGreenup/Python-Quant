(TeX-add-style-hook
 "pythonQuant"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem") ("biblatex" "citestyle=numeric" "bibstyle=numeric" "hyperref=true" "backref=true" "maxcitenames=3" "url=true" "backend=biber" "natbib=true")))
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref"
    "minted"
    "style"
    "biblatex")
   (LaTeX-add-labels
    "sec:org7741831"
    "sec:org0b5f375"
    "sec:org1dd2008"
    "sec:orgcd928cc"
    "sec:orgb3d7cbe"
    "sec:orgec4af5f"
    "eq:bydef"
    "eq:tojustify"
    "eq:matpower"
    "eq:expmatpower"
    "sec:orgb47065d"
    "sec:org14af41f"
    "sec:org7213b67"
    "eq:recurrence-relation-def"
    "eq:gen-func-def"
    "sec:org923a26f"
    "sec:orgca6539d"
    "sec:org5bb5b3e"
    "eq:pow-gen-func-np0"
    "eq:pow-gen-func-np1"
    "eq:pow-gen-func-np2"
    "eq:series-rep-pow-example"
    "eq:power-series-form-example"
    "eq:pow-series-definition"
    "eq:seq-end-value"
    "sec:org9afec04"
    "sec:org92306e9"
    "eq:fib-def"
    "sec:org75ded0c"
    "eq:exp-gen-def-1"
    "eq:exp-gen-def-2"
    "eq:exp-gen-def-3"
    "eq:fib-sol"
    "sec:org7a1e6a4"
    "eq:exp-pow-series"
    "eq:exp-pow-series-sol"
    "sec:org0ab03c7"
    "eq:hom-ode"
    "sec:orgfa9fdd0"
    "sec:orgd8f8b38"
    "eq:exp-gen-def-proof"
    "eq:unique-root-sol-power-series-form"
    "sec:org16e7973"
    "sec:orgf688334"
    "sec:org4fc28ce"
    "sec:org3d6b168"
    "sec:org4877b7e"
    "sec:org74a73d0"
    "sec:orgd307746"
    "sec:org266604b"
    "sec:orgf48a251")
   (LaTeX-add-bibliographies
    "../Resources/references"))
 :latex)

