
build_dataset <- function(){
  
  source(here::here("R","viz_data.R"), local = TRUE)
  
  data_location <- here::here("data","viz_data.csv")
  viz_data() %>%
    readr::write_csv(data_location)
}

build_dataset()
