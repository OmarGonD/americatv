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
tvgo_app_viewID <- 76246634
tvgo_app_viewID <- 117792565 # TV APP - MODULAR


#ROKU #No se considera por la baja cantidad de plays




tvgo_app_5 <- google_analytics(tvgo_app_viewID,
                               date_range = c("2020-01-01", "2020-01-05"),
                               metrics = "totalEvents",
                               dimensions = c("ga:eventCategory", "ga:eventAction", "ga:eventLabel"),
                               useResourceQuotas = TRUE,
                               max = -1)



tvgo_app_10 <- google_analytics(tvgo_app_viewID,
                                date_range = c("2020-01-06", "2020-01-10"),
                                metrics = "totalEvents",
                                dimensions = c("ga:eventCategory", "ga:eventAction", "ga:eventLabel"),
                                useResourceQuotas = TRUE,
                                max = -1)


tvgo_app_15 <- google_analytics(tvgo_app_viewID,
                                date_range = c("2020-01-11", "2020-01-15"),
                                metrics = "totalEvents",
                                dimensions = c("ga:eventCategory", "ga:eventAction", "ga:eventLabel"),
                                useResourceQuotas = TRUE,
                                max = -1)




tvgo_app_20 <- google_analytics(tvgo_app_viewID,
                                date_range = c("2020-01-16", "2020-01-20"),
                                metrics = "totalEvents",
                                dimensions = c("ga:eventCategory", "ga:eventAction", "ga:eventLabel"),
                                useResourceQuotas = TRUE,
                                max = -1)


tvgo_app_25 <- google_analytics(tvgo_app_viewID,
                                date_range = c("2020-01-21", "2020-01-25"),
                                metrics = "totalEvents",
                                dimensions = c("ga:eventCategory", "ga:eventAction", "ga:eventLabel"),
                                useResourceQuotas = TRUE,
                                max = -1)




tvgo_app_30 <- google_analytics(tvgo_app_viewID,
                                date_range = c("2020-01-26", "2020-01-31"),
                                metrics = "totalEvents",
                                dimensions = c("ga:eventCategory", "ga:eventAction", "ga:eventLabel"),
                                useResourceQuotas = TRUE,
                                max = -1)




tvgo_app <- rbind(tvgo_app_5, tvgo_app_10, tvgo_app_15, tvgo_app_20, tvgo_app_25, tvgo_app_30)




tvgo_vod_app_plays <- tvgo_app %>%
                      filter(str_detect(eventCategory, 'Play VOD Item|Player|Play Channel|Play Live Channel')) %>%
                      filter(str_detect(eventAction, 'Player|Play Channel|Play Live Channel|reproduccion|videoStart|reproduccion-discovery|videoStartDiscovery')) 




tvgo_vod_app_plays <- tvgo_vod_app_plays[!grepl("Vivo|vivo", tvgo_vod_app_plays$eventLabel),]

#tvgo_vod_app_plays <- tvgo_vod_app_plays[!grepl("Player ready to play", tvgo_vod_app_plays$eventCategory),]


tvgo_vod_app_plays <- tvgo_vod_app_plays[!grepl("videoEnd|videoPause|videoPlaythrough|videoPlayTry|videoResume", tvgo_vod_app_plays$eventAction),]

test_df <- head(tvgo_vod_app_plays)


tvgo_vod_app_plays$programa <- sub(".*Esto es Guerra.*", "Esto es Guerra", tvgo_vod_app_plays$eventLabel, ignore.case = T)

eeg_df <- tvgo_vod_app_plays[tvgo_vod_app_plays$programa == "Esto es Guerra",]


unique(eeg_df$eventCategory)
unique(eeg_df$eventAction)
unique(eeg_df$eventLabel)

write.csv(eeg_df, "eeg-ene19-tvgo-vod-app.csv")

unique(tvgo_vod_app_plays$programa)
unique(tvgo_vod_app_plays$eventLabel)
unique(tvgo_vod_app_plays$eventCategory)

View(tvgo_vod_app_plays)
colnames(tvgo_vod_app_plays)
new_df <- get_program_name(tvgo_vod_app_plays)

unique(new_df$programa)


tvgo_vod_app_plays$eventLabel <- sub("\\;(.*)", "", tvgo_vod_app_plays$eventLabel)

tvgo_vod_app_plays$eventLabel <- sub("VOD - ", "", tvgo_vod_app_plays$eventLabel)

tvgo_vod_app_plays$eventLabel <- sub("\\-.*", "", tvgo_vod_app_plays$eventLabel)


tvgo_vod_app_plays$eventLabel <- trimws(tvgo_vod_app_plays$eventLabel)


unique(tvgo_vod_app_plays$eventCategory)
unique(tvgo_vod_app_plays$eventLabel)
unique(tvgo_vod_app_plays$eventAction)



View(tvgo_vod_app_plays)

####


tvgo_vod_app_plays_alaire <- tvgo_vod_app_plays %>%
                             filter(str_detect(eventLabel, 'Al Aire')) %>%
                             summarise(totalEvents = sum(totalEvents))



tvgo_vod_app_plays_alaire



###



tvgo_vod_app_plays_ebt <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'En Boca')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_ebt


###



tvgo_vod_app_plays_eet <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'Estás en todas|Estas en todas')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_eet


###

tvgo_vod_app_plays_eeg <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'Esto es Guerra|Esto es guerra')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_eeg


###


tvgo_vod_app_plays_sq <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'Sueña Quinceañera')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_sq


###


tvgo_vod_app_plays_vbq <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'Ven baila quinceañera')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_vbq



###

tvgo_vod_app_plays_lv <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'Los Vilchez|Los Vílchez')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_lv


###


tvgo_vod_app_plays_eada <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'El Artista del Año')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_eada



### ???


tvgo_vod_app_plays_egs <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'El Gran Show')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_egs


### ?????


tvgo_vod_app_plays_drtv <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'Dr TV')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_drtv

###


tvgo_vod_app_plays_mmcm <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'Mi mamá cocina mejor que la tuya')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_mmcm 


###



tvgo_vod_app_plays_esds <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'El show después del show')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_esds 



###



tvgo_vod_app_plays_gb <- tvgo_vod_app_plays %>%
  filter(str_detect(eventLabel, 'Gisela busca')) %>%
  summarise(totalEvents = sum(totalEvents))


tvgo_vod_app_plays_gb 


### tvgo_vod_app LIVE DATAFRAME 

tvgo_vod_app_programas <- c('Al Aire', 'En Boca de todos', 'Estás en todas',
                            'Esto es Guerra', 'Sueña quinceañera', 'Ven baila quinceañera',
                            'Los Vilchez', 'El Artista del Año',
                            'El Gran Show', 'Doctor TV', 'Mi mamá cocina mejor que la tuya',
                            'El Show después del show', 'Gisela busca')


tvgo_vod_app_plays_col <- c(tvgo_vod_app_plays_alaire, tvgo_vod_app_plays_ebt,
                        tvgo_vod_app_plays_eet, tvgo_vod_app_plays_eeg,
                        tvgo_vod_app_plays_sq, tvgo_vod_app_plays_vbq, tvgo_vod_app_plays_lv, 
                        tvgo_vod_app_plays_eada, tvgo_vod_app_plays_egs, tvgo_vod_app_plays_drtv,
                        tvgo_vod_app_plays_mmcm, tvgo_vod_app_plays_esds,
                        tvgo_vod_app_plays_gb)


tvgo_vod_app_df <- tibble(tvgo_vod_app_programas, tvgo_vod_app_plays_col)

View(tvgo_vod_app_df)






