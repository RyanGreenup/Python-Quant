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
    "sec:orgc5bb920"
    "sec:org23344a0"
    "sec:orgfae4678"
    "sec:org383423a"
    "sec:orgb8f2238"
    "sec:orga1629a9"
    "eq:bydef"
    "eq:tojustify"
    "eq:matpower"
    "eq:expmatpower"
    "sec:org62132db"
    "sec:orgf792af7"
    "sec:org7edfdcb"
    "eq:recurrence-relation-def"
    "eq:gen-func-def"
    "sec:org9184d9c"
    "sec:org51a8c10"
    "sec:org1810855"
    "eq:pow-gen-func-np0"
    "eq:pow-gen-func-np1"
    "eq:pow-gen-func-np2"
    "eq:series-rep-pow-example"
    "eq:power-series-form-example"
    "eq:pow-series-definition"
    "eq:seq-end-value"
    "sec:org0605bf0"
    "sec:org75bd205"
    "eq:fib-def"
    "sec:orgd907da9"
    "eq:exp-gen-def-1"
    "eq:exp-gen-def-2"
    "eq:exp-gen-def-3"
    "eq:fib-sol"
    "sec:orgdb25539"
    "eq:exp-pow-series"
    "eq:exp-pow-series-sol"
    "sec:orgb6f746c"
    "eq:hom-ode"
    "sec:orgb340ca6"
    "sec:org0a43d70"
    "sec:org54add16"
    "eq:exp-gen-def-proof"
    "eq:unique-root-sol-power-series-form"
    "sec:org79d67d0"
    "sec:orgd568e5b"
    "sec:org35fa90f"
    "sec:org718be4c"
    "sec:orgd1d83fb"
    "sec:orgb40cbf9"
    "sec:org5c25239"
    "sec:org9377bc5"
    "sec:orgb5b8c7b")
   (LaTeX-add-bibliographies
    "../Resources/references"))
 :latex)

