setwd("~/Coursera/Data Science Specialization/3 Getting and Cleaning Data/GettingAndCleaningData-Wk3")

#getting data from the web
if(!file.exists(".\\Data")){dir.create(".\\Data")}
fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile = ".\\Data\\restaurants.csv")
restData <- read.csv(".\\Data\\restaurants.csv")

#creating sequences
s1 <- seq(1,10,by=2);s1
s2 <- seq(1,10, length = 3); s2
x <- c(1,3,8,25,100); seq(along = x)

#subsetting variables
restData$nearMe = restData$neighborhood %in% c("Rolland Park", "Homeland")
table(restData$nearMe)

#creating bianary Variables
restData$zipWrong = ifelse(restData$zipCode < 0,TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

#creating categorical variables
restData$zipGroups = cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups, restData$zipCode)

#easier cutting
install.packages("Hmisc")
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g=4)
table(restData$zipGroups)
class(restData$zipGroups)

#creating Factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]

class(restData$zcf)

#levels of factor variables
yesno <- sample(c("yes","no"),size = 10,replace = TRUE)
yesnofac = factor(yesno,levels = c("yes", "no"))
yesnofac
as.numeric(yesnofac)
relevel(yesnofac,ref = "yes")

#using the mutate function
library(Hmisc); library(plyr)
restData2 = mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)


