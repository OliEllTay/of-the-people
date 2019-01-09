library(dplyr)

read_ipu_csv <- function(file, data_name){
  #' Read the raw file format from IPU
  #'
  
  readr::read_csv(file,
                  col_names = c("country", "chamber_name", data_name),
                  skip = 3)
}

read_world_bank_indicator_csv <- function(file){
  #'  Read the population percentage of women raw file
  #'  
  
  keep_cols <- c("Country Name", "Country Code", "2017")
  
  raw <- readr::read_csv(file,
                         col_names = TRUE,
                         skip = 4)
  
  
  indicator_code <- unique(raw[, "Indicator Code"])[1]
  
  raw <- raw %>%
    dplyr::select(keep_cols)
  
  names(raw) <- c("Country Name", "Country Code", indicator_code)
  
  raw
}
