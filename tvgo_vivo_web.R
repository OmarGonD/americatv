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
tvgo_web_viewID <- 76246634
tvgo_web_app_viewID <- 117792565 # TV APP - MODULAR


#ROKU #No se considera por la baja cantidad de plays




tvgo_web <- google_analytics(tvgo_web_viewID,
                         date_range = c("2020-01-01", "2020-01-31"),
                         metrics = "totalEvents",
                         dimensions = c("ga:eventCategory", "ga:eventAction", "ga:eventLabel"),
                         anti_sample = TRUE)





tvgo_vivo_web_plays <- tvgo_web %>%
              filter(str_detect(eventCategory, 'Player')) %>%
              filter(str_detect(eventAction, 'reproduccion|videoStart|reproduccion-discovery|videoStartDiscovery')) 




unique(tvgo_vivo_web_plays$eventCategory)
unique(tvgo_vivo_web_plays$eventAction)
unique(tvgo_vivo_web_plays$eventLabel)




tvgo_vivo_web_plays <- tvgo_vivo_web_plays[!grepl("VOD", tvgo_vivo_web_plays$eventLabel),]

tvgo_vivo_web_plays$eventLabel <- sub("LIVE - Vivo: ", "", tvgo_vivo_web_plays$eventLabel)







####


tvgo_vivo_web_plays_alaire <- tvgo_vivo_web_plays %>%
                          filter(str_detect(eventLabel, 'Al Aire')) %>%
                          summarise(totalEvents = sum(totalEvents))



tvgo_vivo_web_plays_alaire



###



tvgo_vivo_web_plays_ebt <- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'En Boca')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_ebt


###



tvgo_vivo_web_plays_eet <- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'Estás en todas|Estas en todas')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_eet


###

tvgo_vivo_web_plays_eeg <- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'Esto es Guerra|Esto es guerra')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_eeg


###


tvgo_vivo_web_plays_sq <- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'Sueña Quinceañera')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_sq


###


tvgo_vivo_web_plays_vbq <- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'Ven baila quinceañera')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_vbq



###

tvgo_vivo_web_plays_lv <- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'Los Vilchez|Los Vílchez')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_lv


###


tvgo_vivo_web_plays_eada <- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'El Artista del Año')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_eada



### ???


tvgo_vivo_web_plays_egs <- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'El Gran Show')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_egs


### ?????


tvgo_vivo_web_plays_drtv <- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'Dr TV')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_drtv

###


tvgo_vivo_web_plays_mmcm <- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'Mi mamá cocina mejor que la tuya')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_mmcm 


###



tvgo_vivo_web_plays_esds<- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'El show después del show')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_esds 



###



tvgo_vivo_web_plays_gb <- tvgo_vivo_web_plays %>%
  filter(str_detect(eventLabel, 'Gisela busca')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vivo_web_plays_gb 


### tvgo_web LIVE DATAFRAME 

tvgo_web_programas <- c('Al Aire', 'En Boca de todos', 'Estás en todas',
                         'Esto es Guerra', 'Sueña quinceañera', 'Ven baila quinceañera',
                         'Los Vilchez', 'El Artista del Año',
                         'El Gran Show', 'Doctor TV', 'Mi mamá cocina mejor que la tuya',
                         'El Show después del show', 'Gisela busca')


tvgo_web_plays_col <- c(tvgo_vivo_web_plays_alaire, tvgo_vivo_web_plays_ebt,
                     tvgo_vivo_web_plays_eet, tvgo_vivo_web_plays_eeg,
                     tvgo_vivo_web_plays_sq, tvgo_vivo_web_plays_vbq, tvgo_vivo_web_plays_lv, 
                     tvgo_vivo_web_plays_eada, tvgo_vivo_web_plays_egs, tvgo_vivo_web_plays_drtv,
                     tvgo_vivo_web_plays_mmcm, tvgo_vivo_web_plays_esds,
                     tvgo_vivo_web_plays_gb)


tvgo_web_df <- data_frame(tvgo_web_programas, tvgo_web_plays_col)


View(tvgo_web_df)



