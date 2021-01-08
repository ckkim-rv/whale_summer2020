install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%
setwd("C:/Users/ChongK/Desktop/whale_summer2020")

data <- read.table("databasetemp.txt", header=T, stringsAsFactors=T)  

year <- data[,5]

whaleid <- data[,1]

id_year <- data.frame(whaleid,year,stringsAsFactors=FALSE)

year <- rle(id_year$year)
whaleid <- cumsum(c(1, year$lengths[-length(year$lengths)]))

id_year<-id_year[whaleid,]

increment <- function(x)
{
  eval.parent(substitute(x <- x + 1))
}

###_______________________________________________________________________###
###_______________________________________________________________________###
###_______________________________________________________________________###
###_______________________________________________________________________###

target <- 1992
t <- 0


seen <- c()

for (i in 1: nrow(id_year)){
  if(id_year[i,2]==target){
    increment(t)
    seen <- c(seen,id_year[i,1])
  }else{
    1
  }
}

id_year1 <- id_year[id_year$whaleid %in% seen,]



