library(googleAuthR)
library(googleAnalyticsR)
library(tidyverse)


#ga_auth()

#IDs: 
#America Entretenimiento: 74415341
#America Deportes: 85872505
#America Noticias: 64180784
#Canal N: 84713686
#TV GO: 76246634


ae_viewID <- 74415341
ad_viewID <- 85872505
an_viewID <- 64180784
canaln_viewID <- 84713686
tvgo_web_web_viewID <- 76246634
tvgo_web_app_viewID <- 117792565 # TV APP - MODULAR


#ROKU #No se considera por la baja cantidad de plays




tvgo_web_web <- google_analytics(tvgo_web_app_viewID,
                                 date_range = c("2020-01-31", "2020-01-31"),
                                 metrics = "totalEvents",
                                 dimensions = c("ga:eventCategory", "ga:eventAction", "ga:eventLabel"),
                                 anti_sample = TRUE)

