get_program_name <- function(data) {
  
  data$programa <- NA
  
  for (i in 1:nrow(data)) {
    

    eeg.path <- ".*Esto es Guerra.*"
    
    
    ### GREPL PART
    eeg <- grepl(eeg.path, data$eventLabel[i], ignore.case = T)
    

    if(eeg) {
      
      data$programa[i] <- "Esto es Guerra"
    }

  
  }
  
  return(data)
  
}
