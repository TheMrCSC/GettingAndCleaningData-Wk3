setwd("~/Coursera/Data Science Specialization/3 Getting and Cleaning Data/GettingAndCleaningData-Wk3")

#getting data from the web
if(!file.exists(".\\Data")){dir.create(".\\Data")}
fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile = ".\\Data\\restaurants.csv")
restData <- read.csv(".\\Data\\restaurants.csv")

#looking at a bit of data
head(restData, n = 3)
tail(restData, n = 3)

#Make Summary
summary(restData)

#More in depth information
str(restData)

#Quantile of quantitative variables
quantile(restData$councilDistrict, na.rm = TRUE)
quantile(restData$councilDistrict, probs = c(0.5,0.75,0.9))

#Make Table
table(restData$zipCode, useNA = "ifany")
table(restData$councilDistrict, restData$zipCode)

#Check for Missing Values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

#Rows and Column Sums
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

#values with specific characters
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212", "21213"))

restData[restData$zipCode %in% c("21212","21213"),]

#Cross Tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt

#Flat tables
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~., data = warpbreaks)
xt

ftable(xt)

#Size of Data set
fakeData = rnorm(1e5)
object.size(fakeData)

print(object.size(fakeData),units = "Mb")