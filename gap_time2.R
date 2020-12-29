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
t_1 <- 0
t_2 <- 0
t_3 <- 0
t_4 <- 0
t_5 <- 0

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

seen1 <- c()

for (i in 1: nrow(id_year1)){
  if(id_year1[i,2]==target+1){
    increment(t_1)
    seen1 <- c(seen1,id_year1[i,1])
  }else{
    1
  }
}

id_year2 <- id_year1[id_year1$whaleid %in% seen1,]

seen2 <- c()

for (i in 1: nrow(id_year2)){
  if(id_year2[i,2]==target+2){
    increment(t_2)
    seen2 <- c(seen2,id_year2[i,1])
  }else{
    1
  }
}

id_year3 <- id_year2[id_year2$whaleid %in% seen2,]

seen3 <- c()

for (i in 1: nrow(id_year3)){
  if(id_year3[i,2]==target+3){
    increment(t_3)
    seen3 <- c(seen3,id_year3[i,1])
  }else{
    1
  }
}

id_year4 <- id_year3[id_year3$whaleid %in% seen3,]

seen4 <- c()

for (i in 1: nrow(id_year4)){
  if(id_year4[i,2]==target+4){
    increment(t_4)
    seen4 <- c(seen4,id_year4[i,1])
  }else{
    1
  }
}

id_year5 <- id_year4[id_year4$whaleid %in% seen4,]

seen5 <- c()

for (i in 1: nrow(id_year5)){
  if(id_year5[i,2]==target+5){
    increment(t_5)
    seen5 <- c(seen5,id_year5[i,1])
  }else{
    1
  }
}



