# load twitter library - the rtweet library is recommended now over twitteR
library(rjson)
library(jsonlite)
# plotting and pipes - tidyverse!
library(ggplot2)
library(dplyr)
library(tidyr)

# animated maps
# to install: devtools::install_github("dgrtwo/gganimate")
# note this required imagemagick to be installed
library(leaflet)
library(gganimate)
library(lubridate)
library(maps)
library(ggthemes)

options(stringsAsFactors = FALSE)


site_locations <- leaflet(Tourism) %>%
  addTiles() %>%
  addCircleMarkers(lng = ~long, lat = ~lat, popup = ~text,
                   radius = 3, stroke = FALSE)

site_locations