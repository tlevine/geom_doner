geom_doner <- function (mapping = NULL, data = NULL, stat = "identity", position = "identity",
na.rm = FALSE, ...) {
  GeomDoner$new(mapping = mapping, data = data, stat = stat, position = position, 
  na.rm = na.rm, ...)
}
      
GeomDoner <- proto(ggplot2:::Geom, {
  objname <- "doner"

  draw_groups <- function(., ...) .$draw(...)
  draw <- function(., data, scales, coordinates, na.rm = FALSE, ...) {    
    data <- remove_missing(data, na.rm, 
      c("label","border","knoblauch","krauter","scharf","zwiebeln","tomaten","salat"),
      name = "geom_doner")
    if (empty(data)) return(zeroGrob())
    for (col in c("knoblauch","krauter","scharf","zwiebeln","tomaten","salat")) {
      data[,col] <- factor(data[,col], levels = c(TRUE, FALSE))
      levels(data[,col]) <- c(paste('mit',col), paste('ohne', col))
    }
    data$border <- factor(data$border)
    levels(data$border) <- c('doner','durum','pide','donerteller')

    attach(data)
    recipe <- paste0(
      '\n',
      label, ': ',
      border,
      paste(sep = '\n* ',
        knoblauch,
        krauter,
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
    border = 'doner', label = Sys.info()[["user"]],
    knoblauch = FALSE,
    krauter = FALSE,
    scharf = FALSE,
    zwiebeln = FALSE,
    tomaten = FALSE,
    salat = FALSE)
})
