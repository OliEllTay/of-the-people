
circle_coord <- function(r, theta){
  
  x <- r * cos(theta)
  y <- r * sin(theta)
  
  c(x, y)
}

point_coordinates <- function(n, rows){
  
  width <- 2000
  height <- 400
  
  locs <- data_frame(placement_id = 1:n,
                     x = 0,
                     y = 0,
                     rotation = 0)
  
  cols <- ceiling(n / rows)
  
  arc_start <- 5/4 * pi
  arc_end <- 7/4 * pi
  arc_rad <- arc_end - arc_start
  circ_max_r <- 2 *width / 3
  circ_min_r <- circ_max_r - height
  
  r_steps <- seq(from = circ_max_r,
                 to = circ_min_r,
                 length.out = rows)
  
  arc_steps <- seq(from = arc_start,
                   to = arc_end,
                   length.out = cols)
  
  
  iter <- 0
  for (i in arc_steps){
    for(j in r_steps){
      iter = iter + 1
      c_loc <- circle_coord(j, i)
      locs$x[iter] <- c_loc[1]
      locs$y[iter] <- c_loc[2]
      locs$rotation[iter] <- i
    }
  }
  
  shft_x <- abs(min(locs$x))
  shft_y <- abs(min(locs$y))
  
  locs %>%
    dplyr::mutate(x = x + shft_x,
                  y = y + shft_y)
}




