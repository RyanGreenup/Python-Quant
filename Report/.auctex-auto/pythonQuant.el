(TeX-add-style-hook
 "pythonQuant"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem") ("biblatex" "citestyle=numeric" "bibstyle=numeric" "hyperref=true" "backref=true" "maxcitenames=3" "url=true" "backend=biber" "natbib=true")))
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
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
    "biblatex"
    "style")
   (LaTeX-add-labels
    "sec:orge9798b6"
    "sec:org0e3c86d"
    "sec:orgc027797"
    "sec:org55a0578"
    "sec:org883d33f"
    "sec:orgf5820a2"
    "eq:bydef"
    "eq:tojustify"
    "eq:matpower"
    "eq:expmatpower"
    "sec:orgf512705"
    "sec:org3723b27"
    "sec:org187decc"
    "eq:recurrence-relation-def"
    "eq:gen-func-def"
    "sec:org739ccfe"
    "sec:org200f07c"
    "sec:orge4b7317"
    "eq:pow-gen-func-np0"
    "eq:pow-gen-func-np1"
    "eq:pow-gen-func-np2"
    "eq:series-rep-pow-example"
    "eq:power-series-form-example"
    "eq:pow-series-definition"
    "eq:seq-end-value"
    "sec:orgfcd5233"
    "sec:org44082bb"
    "eq:fib-def"
    "sec:orgd72c493"
    "eq:exp-gen-def-1"
    "eq:exp-gen-def-2"
    "eq:exp-gen-def-3"
    "eq:fib-sol"
    "sec:org92cf896"
    "eq:exp-pow-series"
    "eq:exp-pow-series-sol"
    "sec:orgf69b0f3"
    "eq:hom-ode"
    "sec:org516b254"
    "sec:org2c8a7a1"
    "sec:org50e07b8"
    "eq:exp-gen-def-proof"
    "eq:unique-root-sol-power-series-form"
    "sec:org031646c"
    "sec:orgb43251d"
    "eq:hom-repeated-roots-recurrence"
    "eq:rep-roots-func-ode"
    "eq:rep-roots-recurrence-char-sol"
    "eq:rep-roots-ode-sol"
    "eq:uniq-roots-pow-series-ident"
    "sec:org8dde82d"
    "sec:org3b066c5"
    "eq:gen-form-rep-roots-ode"
    "eq:sol-rep-roots-ode"
    "sec:org1ac5cfc"
    "sec:org888beae"
    "sec:org0a544af"
    "sec:orgd7043b2"
    "sec:orgcb7b0a9"
    "sec:orgf5900a9"
    "sec:org062633b")
   (LaTeX-add-bibliographies
    "../Resources/references"))
 :latex)

