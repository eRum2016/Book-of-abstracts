# devtools::install_github('eRum2016/erum')
library('rmarkdown')
library('tidyverse')

fl <- dir('abstracts_rmd/', full.names = TRUE)

safe_render <- safely(render)
fl %>% map(~safe_render(input=., output_dir='abstracts'))
system('cd abstracts; find . -name "*.pdf" -type f -delete')
