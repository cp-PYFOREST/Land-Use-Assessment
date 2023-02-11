## ----input data------------------------------
select_property <- function(property_cat) {
  property_cat <- as.character(property_cat)
  property_cat <- paste0('0', property_cat)
  print(property_cat)
  if (property_cat %in% limit_lu$cat) {
    boundary <- limit_lu |>
      filter(cat == property_cat)
  }
  else{
    print('Invalid Property')
  }
}

#NEED TO DEVELOP TEST FOR SF OBJECT
#if(class(p)[1] != "sf") p <- sf::st_as_sf(p)


## --------------------------------------------
property_dimensions <- function(paddock_area = 999000,
                                hedgerow_width = 100,
                                width_paddock = 1,
                                height_paddock = 1) {
  #Dimensions
  max_pad <- paddock_area
  max_hedgerow <- hedgerow_width
  pad_hedge <- max_pad + max_hedgerow
  
  # Aspect Ratio (from square to rectangle)
  ratio_x <- c(1, 2, 3, 4)
  ratio_y <- c(1, 2, 3, 4)
  
  
  
  if (width_paddock %in% ratio_x & height_paddock %in% ratio_y) {
    y <-
      sqrt(pad_hedge / (ratio_x[width_paddock] / ratio_y[height_paddock]))
    
    x <-
      sqrt(pad_hedge * (ratio_x[width_paddock] / ratio_y[height_paddock]))
    
    x_y <- tibble(x, y)
    
    return(x_y)
  } else{
    print('INVALID RATIO OF WIDTH TO HEIGHT')
  }
  
}



## --------------------------------------------
grid_rotate <-
  function(boundary_property = property_boundary,
           x_y = pad_hedg_dim) {
    coords_df <- st_coordinates(property_boundary)
    
    number_col <- ncol(coords_df)
    x1 <- coords_df[1, 1]
    y1 <- coords_df[1, 2]
    x2 <- coords_df[2, 1]
    y2 <- coords_df[2, 2]
    
    
    
    # calcualte the angle in radians and the trasformate to degrees
    angle_r <- atan2(y2 - y1, x2 - x1)
    #angle_r <- atan2(height, base)
    
    angle <- 90 + ((angle_r * (180 / pi)) * -1)
    angle
    
    
    
    inpoly <- boundary_property |>
      st_geometry()
    rotang = angle #should be angle need to fix
    
    
    
    rot = function(a)
      matrix(c(cos(a), sin(a), -sin(a), cos(a)), 2, 2)
    
    
    
    tran = function(geo, ang, center)
      (geo - center) * rot(ang * pi / 180) + center
    
    center <- st_centroid(st_union(boundary_property))
    
    
    grd <-
      sf::st_make_grid(tran(inpoly, -rotang, center),
                       cellsize = c(x_y[[1]], x_y[[2]]),
                       n = 100)
    
    
    
    grd_rot <- tran(grd, rotang, center) |> st_set_crs("EPSG:32721")
    
    
    
    
    
    test_rot <-  st_intersection(grd_rot, boundary_property)
  }


