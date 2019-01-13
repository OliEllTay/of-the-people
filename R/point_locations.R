

point_coordinates <- function(n, rows){
  
  width <- 1000
  height <- 400
  
  locs <- data_frame(placement_id = 1:n,
                     x = 0,
                     y = 0)
  
  cols <- ceiling(n / rows)
  y_step <- height / (rows - 1)
  x_step <- width / (cols - 1)
  
  
  iter <- 0
  for(i in 1:cols){
    for(j in 1:rows){
      iter = iter + 1
      if(iter <= n){
        locs$x[iter] <- (i - 1) * x_step
        locs$y[iter] <- (j - 1) * y_step
      }
    }
  }
  
  locs
}




