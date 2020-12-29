install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%
setwd("C:/Users/ChongK/Desktop/whale_summer2020")

data <- read.table("databasetemp.txt", header=T, stringsAsFactors=T)  

year <- data[,5]

month <- data[,6]

day <- data[,7]


# unq_w <- unique(data$SightingEGNo)
# year_data <- data.frame(data$SightingEGNo,data$SightingYear)
# 
# wed <- function(year,data_table){
#   n <- nrow(data_table)
#   seen_whales <- c()
#   for(i in n){
#     if(any(data_table[,2] == year)){
#       seen_whales <- c(seen_whales,i)
#     }
#   }
#   return(seen_whales)
# }
# 
# wed(1999,data)



#----------------------------------------------------------
n <- nrow(data)
whales_to_delete <- c() 

#take gaps of different whales
for(i in 2: n){
  if(data[i,"SightingEGNo"] != data[i-1,"SightingEGNo"]){
    whales_to_delete <- c(whales_to_delete,i)
  }
}

whales_to_delete <- whales_to_delete + 1

date <- as.Date(paste(year, "-", month, "-", day, sep=""))
gaps <- (date[1:(n-1)] - date[2:n]) / 365.25

#take out gap times for different whales ID whales
gaps = gaps[!(gaps %in% whales_to_delete)]

#take NA values out
gaps <- gaps[!is.na(gaps)]

gaps <- as.numeric(gaps)

gaps <- gaps*(365)

# only take gaps that are negative (otherwise it's nonsensical)
gaps <- gaps[ 0 > gaps]

gaps <- gaps*(-1)

