geom_taco <- function (mapping = NULL, data = NULL, stat = "identity", position = "identity",
na.rm = FALSE, ...) {
  GeomTaco$new(mapping = mapping, data = data, stat = stat, position = position, 
  na.rm = na.rm, ...)
}
      
GeomTaco <- proto(ggplot2:::Geom, {
  objname <- "taco"

  draw_groups <- function(., ...) .$draw(...)
  draw <- function(., data, scales, coordinates, na.rm = FALSE, ...) {    
    data <- remove_missing(data, na.rm, 
      c("label","fill","salsa","lime","radish","guacamole","cilantro"), name = "geom_taco")
    if (empty(data)) return(zeroGrob())
    for (col in c('lime','radish','guacamole','cilantro')) {
      data[,col] <- factor(data[,col], levels = c(TRUE, FALSE))
      levels(data[,col]) <- c(col, paste('No', col))
    }
    data$salsa <- cut(data$salsa, 3)
    levels(data$salsa) <- c('Mild', 'Medium', 'Mild)

    attach(data)
    recipe <- paste0(
      '\n',
      'One taco for "', label, '" with:\n',
      paste(sep = '\n',
        fill,
        paste(salsa, 'salsa'),
        lime,
        radish,
        guacamole,
        cilantro
      ),
      '\n'
    )
    cat(recipe)
  }

  draw_legend <- function(., data, ...) {
    data <- aesdefaults(data, .$default_aes(), list(...))
  }

  default_stat <- function(.) StatIdentity
  required_aes <- c()
  default_aes <- function(.) aes(
    fill = 'carne asada', label = Sys.info()[["user"]],
    salsa = FALSE, lime = FALSE, radish = FALSE,
    guacamole = FALSE, cilantro = FALSE)
})
