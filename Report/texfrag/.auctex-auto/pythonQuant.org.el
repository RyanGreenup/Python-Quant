(TeX-add-style-hook
 "pythonQuant.org"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("color" "usenames") ("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem") ("biblatex" "citestyle=numeric" "bibstyle=numeric" "hyperref=true" "backref=true" "maxcitenames=3" "url=true" "backend=biber" "natbib=true")))
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "color"
    "minted"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "biblatex")
   (LaTeX-add-labels
    "eq:bydef"
    "eq:tojustify"
    "eq:matpower"
    "eq:expmatpower"
    "eq:recurrence-relation-def"
    "eq:gen-func-def"
    "eq:pow-gen-func-np0"
    "eq:pow-gen-func-np1"
    "eq:pow-gen-func-np2"
    "eq:series-rep-pow-example"
    "eq:power-series-form-example"
    "eq:pow-series-definition"
    "eq:seq-end-value"
    "eq:fib-def"
    "eq:exp-gen-def-1"
    "eq:exp-gen-def-2"
    "eq:exp-gen-def-3"
    "eq:fib-sol"
    "eq:exp-pow-series"
    "eq:exp-pow-series-sol"
    "eq:hom-ode"
    "eq:exp-gen-def-proof"
    "eq:unique-root-sol-power-series-form"
    "eq:hom-repeated-roots-recurrence"
    "eq:rep-roots-func-ode"
    "eq:rep-roots-recurrence-char-sol"
    "eq:rep-roots-ode-sol"
    "eq:uniq-roots-pow-series-ident"
    "eq:gen-form-rep-roots-ode"
    "eq:sol-rep-roots-ode")
   (LaTeX-add-bibliographies
    "../Resources/references"))
 :latex)

