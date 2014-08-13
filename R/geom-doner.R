geom_döner <- function (mapping = NULL, data = NULL, stat = "identity", position = "identity",
na.rm = FALSE, ...) {
  GeomDöner$new(mapping = mapping, data = data, stat = stat, position = position, 
  na.rm = na.rm, ...)
}
      
GeomDöner <- proto(ggplot2:::Geom, {
  objname <- "döner"

  draw_groups <- function(., ...) .$draw(...)
  draw <- function(., data, scales, coordinates, na.rm = FALSE, ...) {    
    data <- remove_missing(data, na.rm, 
      c("label","border","knoblauch","kräuter","scharf","zwiebeln","tomaten","salat"),
      name = "geom_döner")
    if (empty(data)) return(zeroGrob())
    for (col in c("knoblauch","kräuter","scharf","zwiebeln","tomaten","salat")) {
      data[,col] <- factor(data[,col], levels = c(TRUE, FALSE))
      levels(data[,col]) <- c(paste('mit',col), paste('ohne', col))
    }
    data$border <- factor(data$border)
    levels(data$border) <- c('döner','durum','pide','dönerteller')

    attach(data)
    recipe <- paste0(
      '\n',
      label, ': ',
      border,
      paste(sep = '\n* ',
        knoblauch,
        kräuter,
        scharf,
        zwiebeln,
        tomaten,
        salat
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
    border = 'döner', label = Sys.info()[["user"]],
    knoblauch = FALSE,
    kräuter = FALSE,
    scharf = FALSE,
    zwiebeln = FALSE,
    tomaten = FALSE,
    salat = FALSE)
})
