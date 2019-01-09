
read_ipu_csv <- function(file, data_name){
  #' Read the raw file format from IPU
  #'
  
  readr::read_csv(file,
                  col_names = c("country", "chamber_name", data_name),
                  skip = 3)
}

