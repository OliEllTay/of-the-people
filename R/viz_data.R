

viz_data <- function(){
  #' Build visualisation data set
  #' 
  
  source(here::here("R", "combine_raw_data.R"), local = TRUE)
  
  # read and remove any NAs
  raw_data <- combined_raw_data() %>%
    dplyr::filter_all(all_vars(!is.na(.)))
  
  data <- raw_data %>%
    mutate(
      pop_women = `SP.POP.TOTL.FE.ZS`,
      par_women = `chamber_current_women_percent`,
      par_u40 = `chamber_total_younger_40_percentage`
    )  %>%
    dplyr::mutate(
      pop_u40 = dplyr::case_when(
        chamber_field_min_age_member_parl >= 40 ~ 0,
        chamber_field_min_age_member_parl >= 35 ~ `SP.POP.3539.FE.5Y` + `SP.POP.3539.MA.5Y`,
        chamber_field_min_age_member_parl >= 30 ~ `SP.POP.3034.FE.5Y` + `SP.POP.3034.MA.5Y` + `SP.POP.3539.FE.5Y` + `SP.POP.3539.MA.5Y`,
        chamber_field_min_age_member_parl >= 25 ~ `SP.POP.2529.FE.5Y` + `SP.POP.2529.MA.5Y` + `SP.POP.3034.FE.5Y` + `SP.POP.3034.MA.5Y` + `SP.POP.3539.FE.5Y` + `SP.POP.3539.MA.5Y`,
        TRUE ~ `SP.POP.2024.FE.5Y` + `SP.POP.2024.MA.5Y` + `SP.POP.2529.FE.5Y` + `SP.POP.2529.MA.5Y` + `SP.POP.3034.FE.5Y` + `SP.POP.3034.MA.5Y` + `SP.POP.3539.FE.5Y` + `SP.POP.3539.MA.5Y`
      )
    ) %>%
    select(country,
           region,
           pop_women,
           par_women,
           pop_u40,
           par_u40)
  
  # Placement ID
  data <- data %>%
    dplyr::mutate(placement_id = row_number())
  
  # Point locations
  n_countries <- nrow(data)
  source(here::here("R","point_locations.R"), local = TRUE)
  locs <- point_coordinates(n = n_countries,
                            rows = 6)
  data <- data %>%
    left_join(locs)
  
  data

}


