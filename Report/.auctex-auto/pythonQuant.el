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
    "biblatex")
   (LaTeX-add-labels
    "sec:orgc40dc55"
    "sec:orgc1442d0"
    "sec:org08b0575"
    "sec:orgaaa51eb"
    "sec:org0c07e01"
    "sec:orgb0a793e"
    "eq:bydef"
    "eq:tojustify"
    "eq:matpower"
    "eq:expmatpower"
    "sec:org6389c99"
    "sec:orgc7506d3"
    "sec:orga125b82"
    "sec:org0dcad4d"
    "sec:orga66fb02"
    "sec:org3d2247c"
    "sec:orgeed800d"
    "sec:orgc586201"
    "sec:org90d342b"
    "sec:org25a8b07"
    "sec:orgf6cf24d"
    "sec:org7343115"
    "sec:org9f4e42e"
    "sec:org239bacf"
    "sec:org0b2c4be"
    "sec:orgdd581ff"
    "sec:orgd3f3c89"
    "eq:pow-gen-func-np0"
    "eq:pow-gen-func-np1"
    "eq:pow-gen-func-np2"
    "eq:series-rep-pow-example"
    "eq:power-series-form-example"
    "sec:orgdfa6c3d"
    "sec:orgbcf1a0b"
    "sec:org3874f38"
    "sec:org9275af1"
    "sec:orgba0dc62")
   (LaTeX-add-environments
    '("sol" LaTeX-env-args ["argument"] 0))
   (LaTeX-add-bibliographies
    "../Resources/references"))
 :latex)

