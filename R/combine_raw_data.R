
country_name_conversions <- function(name){
  #' Fix differences in country names
  #' 
  
  dplyr::case_when(
    name == "Bahamas, The" ~ "Bahamas",
    name == "Bolivia" ~ "Bolivia (Plurinational State of)",
    name == "Congo, Dem. Rep." ~ "Democratic Republic of the Congo",
    name == "Congo, Rep." ~ "Congo",
    name == "Cote d'Ivoire" ~ "Côte d'Ivoire",
    name == "Egypt, Arab Rep." ~ "Egypt",
    name == "Gambia, The" ~ "Gambia (The)",
    name == "Iran, Islamic Rep." ~ "Iran (Islamic Republic of)",
    name == "Korea, Dem. People’s Rep." ~ "Democratic People's Republic of Korea",
    name == "Korea, Rep." ~ "Republic of Korea",
    name == "Kyrgyz Republic" ~ "Kyrgyzstan",
    name == "Lao PDR" ~ "Lao People's Democratic Republic",
    name == "Macedonia, FYR" ~ "The former Yugoslav Republic of Macedonia",
    name == "Micronesia, Fed. Sts." ~ "Micronesia (Federated States of)",
    name == "Moldova" ~ "Republic of Moldova",
    name == "St. Kitts and Nevis" ~ "Saint Kitts and Nevis",
    name == "St. Lucia" ~ "Saint Lucia",
    name == "St. Vincent and the Grenadines" ~ "Saint Vincent and the Grenadines",
    name == "Slovak Republic" ~ "Slovakia",
    name == "Tanzania" ~ "United Republic of Tanzania",
    name == "United States" ~ "United States of America",
    name == "Venezuela, RB" ~ "Venezuela (Bolivarian Republic of)",
    name == "Vietnam" ~ "Viet Nam",
    name == "Yemen, Rep." ~ "Yemen",
    
    TRUE ~ name
  )
  
}

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
    
  ipu_countries <- unique(ipu_data$country)
  
  # World Bank Indicator Data
  world_bank_files <- list.files(path = raw_data_dir,
                                 pattern = "API_SP.",
                                 full.names = TRUE)
  
  world_bank_data <- world_bank_files %>%
    purrr::map(read_world_bank_indicator_csv) %>%
    purrr::reduce(rbind)
  
  # Combine data sources
  tall <- rbind(ipu_data, world_bank_data)
  
  # Spread stats
  country_stat <- tall %>%
    dplyr::mutate(country = country_name_conversions(country)) %>%
    tidyr::spread(key = statistic, value = value)
  
  # Regions
  reg <- readr::read_csv(here::here("raw-data","country_regions.csv"))
  country_stat <- country_stat %>%
    dplyr::left_join(reg)
  
  country_stat
  
}
