library('readxl')
library('purrr')
library('xtable')

work <- read_excel('figs/workshops_location.xlsx')
x <- xtable(work, digits=0)
align(x) <- "p{0.1cm}|p{11.1cm}|p{4.6cm}|"
print(x, type="latex", file="figs/workshops_location.tex", include.rownames=FALSE, 
      tabular.environment='longtable', floating=FALSE, size="\\fontsize{9pt}{10pt}\\selectfont")
