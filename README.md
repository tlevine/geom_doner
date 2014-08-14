# Install 

```r
library("devtools")
install_github("geomdoner", "tlevine")
```

Windows users also must first install
[Rtools](http://cran.rstudio.com/bin/windows/Rtools/).
 
# Example


```r
library(geomdoner)

mpg$truck <- mpg$class
levels(mpg$truck) <- c(TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,TRUE)

mpg$y2008 <- mpg$year == 2008 # Alternative is 1999
mpg$id <- row.names(mpg)

set.seed(693)
ggplot(mpg[sample.int(nrow(mpg), 8),]) +
  aes(label = paste0('Make #', id, ' (', manufacturer, ' ', model, ')'),
      border = drv,
      knoblauch = truck,
      scharf = grepl('auto', trans),
      zwiebeln = y2008,
      tomaten = TRUE, salat = TRUE,
      x = hwy, y = cty) +
  xlab('Highway miles per gallon') +
  ylab('City miles per gallon') +
  ggtitle('Milage of eight automobile makes.\n(Each döner is a make.)') +
  geom_text() + geom_doner()
```

![plot of chunk mpg](figure/mpg.png) 

```
## 
## Make #142 (nissan altima): durumohne knoblauch
## * ohne krauter
## * ohne scharf
## * ohne zwiebeln
## * mit tomaten
## * mit salat
##  
## Make #13 (audi a4 quattro): donerohne knoblauch
## * ohne krauter
## * ohne scharf
## * ohne zwiebeln
## * mit tomaten
## * mit salat
##  
## Make #107 (honda civic): durumohne knoblauch
## * ohne krauter
## * mit scharf
## * mit zwiebeln
## * mit tomaten
## * mit salat
##  
## Make #86 (ford f150 pickup 4wd): donermit knoblauch
## * ohne krauter
## * ohne scharf
## * ohne zwiebeln
## * mit tomaten
## * mit salat
##  
## Make #42 (dodge caravan 2wd): durumohne knoblauch
## * ohne krauter
## * mit scharf
## * mit zwiebeln
## * mit tomaten
## * mit salat
##  
## Make #98 (ford mustang): pideohne knoblauch
## * ohne krauter
## * mit scharf
## * mit zwiebeln
## * mit tomaten
## * mit salat
##  
## Make #175 (toyota 4runner 4wd): donermit knoblauch
## * ohne krauter
## * mit scharf
## * ohne zwiebeln
## * mit tomaten
## * mit salat
##  
## Make #118 (hyundai tiburon): durumohne knoblauch
## * ohne krauter
## * ohne scharf
## * mit zwiebeln
## * mit tomaten
## * mit salat
```
