library("googleAuthR")
library("googleAnalyticsR")



ae_viewID <- 74415341
ad_viewID <- 85872505
an_viewID <- 64180784
canaln_viewID <- 84713686
tvgo_web_viewID <- 76246634
tvgo_app_viewID <- 165895136 #ROKU




america_entretenimiento_plays <- google_analytics(ae_viewID,
                                                  date_range = c("2020-01-01", "2020-01-31"),
                                                  metrics = "totalEvents",
                                                  dimensions = c("ga:eventCategory", "ga:eventAction", "ga:eventLabel"),
                                                  anti_sample = TRUE)



ae_plays <- america_entretenimiento_plays %>%
            filter(str_detect(eventCategory, 'Player')) %>%
            filter(str_detect(eventAction, 'reproduccion|videoStart|reproduccion-discovery|videoStartDiscovery')) 





ae_plays_alaire <- ae_plays %>%
                   filter(str_detect(eventLabel, 'al-aire')) %>%
                   summarise(totalEvents = sum(totalEvents))


ae_plays_alaire

#ae_plays_vod <- ae_plays %>%
#  filter(str_detect(eventLabel, 'VOD'))

ae_total_plays <- ae_plays %>%
  summarise(totalEvents = sum(totalEvents))

##########################################
# Solo TVGO Tiene Plays (Eventos) Live ##
#########################################

#ae_plays_live <- ae_plays %>%
#                 filter(str_detect(eventLabel, 'LIVE'))
                  

########################
########## EEG #########
########################

ae_plays_eeg <- ae_plays %>%
                filter(str_detect(eventLabel, 'esto-es-guerra')) %>%
                summarise(totalEvents = sum(totalEvents))


ae_plays_eeg



########################
########## EBT #########
########################

ae_plays_ebt<- ae_plays %>%
  filter(str_detect(eventLabel, 'en-boca-de-todos')) %>%
  summarise(totalEvents = sum(totalEvents))


ae_plays_ebt


########################
###### Los Vilchez #####
########################

ae_plays_lv<- ae_plays %>%
  filter(str_detect(eventLabel, 'los-vilchez')) %>%
  summarise(totalEvents = sum(totalEvents))


ae_plays_lv



#####################################
###### El Show después del show #####
#####################################

ae_plays_esdds<- ae_plays %>%
  filter(str_detect(eventLabel, 'el-show-despues-del-show')) %>%
  summarise(totalEvents = sum(totalEvents))


ae_plays_esdds




#####################################
######### El Artista del Año ########
#####################################

ae_plays_eada<- ae_plays %>%
  filter(str_detect(eventLabel, 'el-artista-del-ano')) %>%
  summarise(totalEvents = sum(totalEvents))


ae_plays_eada



#####################################
############# Doctor TV #############
#####################################

ae_plays_drtv <- ae_plays %>%
  filter(str_detect(eventLabel, 'doctor-tv')) %>%
  summarise(totalEvents = sum(totalEvents))


ae_plays_drtv



#####################################
######### Estás en todas ############
#####################################

ae_plays_eet <- ae_plays %>%
  filter(str_detect(eventLabel, 'estas-en-todas')) %>%
  summarise(totalEvents = sum(totalEvents))


ae_plays_eet



#####################################
######## ven baila quinceañera ######
#####################################

ae_plays_vbq <- ae_plays %>%
  filter(str_detect(eventLabel, 'ven-baila-quinceanera')) %>%
  summarise(totalEvents = sum(totalEvents))


ae_plays_vbq



#####################################
########### El Gran Show ############
#####################################

ae_plays_egs <- ae_plays %>%
  filter(str_detect(eventLabel, 'el-gran-show')) %>%
  summarise(totalEvents = sum(totalEvents))


ae_plays_egs




#####################################
######## Sueña quinceañera ##########
#####################################

ae_plays_sq <- ae_plays %>%
  filter(str_detect(eventLabel, 'suena-quinceanera')) %>%
  summarise(totalEvents = sum(totalEvents))


ae_plays_sq


#####################################
########### Gisela busca ############
#####################################

ae_plays_gb <- ae_plays %>%
  filter(str_detect(eventLabel, 'gisela-busca')) %>%
  summarise(totalEvents = sum(totalEvents))


ae_plays_gb



#####################################
##### Mi mamá cocina mejor ##########
#####################################

ae_plays_mmcm <- ae_plays %>%
  filter(str_detect(eventLabel, 'mi-mama-cocina-mejor')) %>%
  summarise(totalEvents = sum(totalEvents))


ae_plays_mmcm



####


ae_programa <- c('Al Aire','En Boca de Todos','Estás en todas', 'Esto Es Guerra', 'Sueña quinceañera',
                 'Ven baila quinceañera', 'Los Vilchez', 'El Artista del Año', 'El Gran Show', 'Doctor TV',
                 'Mi mamá cocina mejor', 'El Show después del Show', 'Gisela busca')
plays <- c(ae_plays_alaire, ae_plays_ebt, ae_plays_eet, ae_plays_eeg, ae_plays_sq,
           ae_plays_vbq, ae_plays_lv, ae_plays_eada, ae_plays_egs, ae_plays_drtv,
           ae_plays_mmcm, ae_plays_esdds, ae_plays_gb)


ae_plays_final <- data_frame(ae_programa, plays)

ae_plays_final

