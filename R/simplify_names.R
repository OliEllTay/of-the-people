
simplify_country_names <- function(name){
  
  dplyr::case_when(
    name == "Gambia (The)" ~ "Gambia",
    name == "Iran (Islamic Republic of)" ~ "Iran",
    name == "Micronesia (Federated States of)" ~ "Micronesia",
    name == "Republic of Korea" ~ "South Korea",
    name == "Russian Federation" ~ "Russia",
    name == "The former Yugoslav Republic of Macedonia" ~ "FYR Macedonia",
    name == "United Republic of Tanzania" ~ "Tanzania",
    name == "Venezuela (Bolivarian Republic of)" ~ "Venezuela",
    TRUE ~ name
  )
}