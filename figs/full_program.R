library('readxl')
library('purrr')
library('xtable')

program <- read_excel('figs/Preliminary_program.xlsx', sheet=2)[c(1:84), c(1, 3:6)]
names(program) <- c("Session", "Name", "Surname", "Title", "Chairman")
x <- xtable(program, digits=0)
align(x) <- "p{0.01cm}|p{2.6cm}|p{1.7cm}|p{2.0cm}|p{6.5cm}|p{1.5cm}|"
print(x, type="latex", file="figs/full_program.tex", include.rownames=FALSE, 
      tabular.environment='longtable', floating=FALSE, size="\\fontsize{9pt}{10pt}\\selectfont")
