
build_dataset <- function(){
  
  source(here::here("R","viz_data.R"), local = TRUE)
  
  data_location <- here::here("data","viz_data.rds")
  viz_data() %>%
    readr::write_rds(data_location)
}

build_dataset()
