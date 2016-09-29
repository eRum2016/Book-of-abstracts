library('googlesheets')
library('magrittr')
library('knitr')
library('RefManageR')
library('rmarkdown')
library('purrr')
library('dplyr')
# devtools::install_github('eRum2016/erum')

# Reading of google sheet data
gs_auth(new_user = TRUE)
gap_url <- "https://docs.google.com/spreadsheets/d/1EvGkOt-N_qaGaza9q9j8il4Iw1qNKTcSqT7pRErEk_Q/edit?ts=57bcbc93#gid=0"
gap <- gap_url %>% gs_url()
sheet <- gs_read(gap)

## Names cleaning and id adding
names(sheet) <- gsub(' ', '_', names(sheet))
names(sheet) <- gsub('/', '_', names(sheet))
sheet <- sheet %>% arrange(Surname)
sheet$id <- seq_len(nrow(sheet))

## Creating betas of abstracts using template
abstract_creation <- function(id, df){
        info <- df[id, ]
        output_name <- paste0(formatC(info$id, width=2, flag="0"), '_', info$Surname)
        render("_template.Rmd", output_format='md_document', 
               output_options=list(preserve_yaml = TRUE),
               output_file=paste0(output_name, '.Rmd'))
        ifelse(!dir.exists(file.path("templates")), dir.create(file.path(templates)), FALSE)
        file.rename(paste0(output_name, '.Rmd'), paste0("templates/", paste0(output_name, '.Rmd')))
        file.copy(paste0("templates/", output_name, '.Rmd'), paste0("templates/cleaned"), overwrite=TRUE)
}

sheet$id %>% map(~abstract_creation(., sheet))

