
combined_raw_data <- function(){
  #' Read and join raw data sources together
  #' 
  
  source(here::here("R","read_raw_data.R"), local = TRUE)
  
  raw_data_dir <- here::here("raw-data")
  
  # IPU Data
  ipu_files <- list.files(path = raw_data_dir,
                          pattern = "chamber--",
                          full.names = TRUE)
  
  ipu_data <- ipu_files %>%
    purrr::map(read_ipu_csv) %>% 
    purrr::reduce(rbind)
    
  
  # World Bank Indicator Data
  world_bank_files <- list.files(path = raw_data_dir,
                                 pattern = "API_SP.",
                                 full.names = TRUE)
  
  world_bank_data <- world_bank_files %>%
    purrr::map(read_world_bank_indicator_csv) %>%
    purrr::reduce(rbind)
  
  # Combine data sources
  rbind(ipu_data, world_bank_data)
  
}
