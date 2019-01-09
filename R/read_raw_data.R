library(dplyr)

parse_ipu_filename <- function(filename){
  
  split1 <- strsplit(filename, "--")
  
  split2 <- strsplit(split1[[1]][2], ".csv")[[1]][1]
  
  paste0("chamber_", split2)
}

read_ipu_csv <- function(file){
  #' Read the raw file format from IPU
  #'
  
  stat_name <- parse_ipu_filename(file)
  
  raw <- readr::read_csv(file,
                         col_names = c("country", "chamber", "value"),
                         skip = 3)
  
  raw %>%
    dplyr::mutate(statistic = stat_name) %>%
    select(country, statistic, value)
  
}

read_world_bank_indicator_csv <- function(file){
  #'  Read the population percentage of women raw file
  #'  
  
  keep_cols <- c("Country Name", "Indicator Code", "2017")
  
  raw <- readr::read_csv(file,
                         col_names = TRUE,
                         skip = 4)
  
  raw <- raw %>%
    dplyr::select(keep_cols)
  
  names(raw) <- c("country", "statistic", "value")
  
  raw
}
