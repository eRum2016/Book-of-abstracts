library('readxl')
library('purrr')
library('xtable')

work <- read_excel('figs/workshops_location.xlsx')

m_work <- work[c(1:5), ]
a_work <- work[c(6:10), ]

names(m_work) <- c("Morning workshops (9:00 - 12:30)", "Location")
names(a_work) <- c("Afternoon workshops (9:00 - 12:30)", "Location")

x1 <- xtable(m_work, digits=0)
align(x1) <- "p{0.1cm}|p{8.2cm}|p{4.6cm}|"
print(x1, type="latex", file="figs/m_workshops_location.tex", include.rownames=FALSE, 
      tabular.environment='longtable', floating=FALSE, size="\\fontsize{9pt}{10pt}\\selectfont")

x2 <- xtable(a_work, digits=0)
align(x2) <- "p{0.1cm}|p{8.2cm}|p{4.6cm}|"
print(x2, type="latex", file="figs/a_workshops_location.tex", include.rownames=FALSE, 
      tabular.environment='longtable', floating=FALSE, size="\\fontsize{9pt}{10pt}\\selectfont")
