(TeX-add-style-hook
 "references"
 (lambda ()
   (LaTeX-add-bibitems
    "barradasIteratedExponentiationMatrixMatrix1994"
    "hallLieGroupsLie2015"
    "MatricesSymPyDocumentation2020"
    "MatrixExponentialIssue2019"
    "parkPowerWalkRevisiting2013"
    "Zil2009"
    "zillMatrixExponential2009")
   (LaTeX-add-environments
    '("sol" LaTeX-env-args ["argument"] 0)))
 :bibtex)

