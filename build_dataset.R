
build_dataset <- function(){
  
  source(here::here("R","viz_data.R"), local = TRUE)
  
  data_location <- here::here("of_the_people_viz","viz_data.csv")
  viz_data() %>%
    readr::write_csv(data_location)
}

build_dataset()
