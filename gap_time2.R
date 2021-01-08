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
t1 <- 0
t2 <- 0
t3 <- 0
t4 <- 0
t5 <- 0

gap_time <- function(idyear,n,target_year,seen,tally)
{
    for (i in 1: nrow(idyear)){
    if(idyear[i,2]==target_year+n){
      increment(tally)
      seen <- c(seen,idyear[i,1])
    }else{
      1
    }
  }
}

seen0 <- c()

gap_time(id_year,0,target,seen0,t)

id_year1 <- id_year[id_year$whaleid %in% seen,]

seen1 <- c()

gap_time(id_year,1,target,seen1,t1)

id_year2 <- id_year1[id_year1$whaleid %in% seen1,]

seen2 <- c()

gap_time(id_year,2,target,seen2,t2)

id_year3 <- id_year2[id_year2$whaleid %in% seen2,]

seen3 <- c()

gap_time(id_year,3,target,seen3,t3)

id_year4 <- id_year3[id_year3$whaleid %in% seen3,]

seen4 <- c()

gap_time(id_year,4,target,seen4,t4)

id_year5 <- id_year4[id_year4$whaleid %in% seen4,]

seen5 <- c()

gap_time(id_year,5,target,seen5,t5)

tally_results <- c(t,t1,t2,t3,t4,t5)

print(tally_results)

