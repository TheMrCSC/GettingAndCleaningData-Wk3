#Question 1
URLcsv <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(URLcsv, ".\\Data\\agriData.csv")
agri <- read.csv(".\\Data\\agriData.csv")
#agri[agri$ACR == 3 & agri$AGS == 6 & !is.na(agri$ACR) & !is.na(agri$AGS),]
agri$sel <- agri$ACR == 3 & agri$AGS == 6 & !is.na(agri$ACR) & !is.na(agri$AGS)
agricultureLogical <- agri$sel
which(agricultureLogical)


#agricul <- tbl_df(agri)
#logical_vec = c(TRUE, FALSE,TRUE)
#class(logical_vec)
#which(logical_vec)

#Question 2
library(jpeg)
URLq2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(URLq2, ".\\Data\\instructor.jpeg", method = "curl")
#img.n <- readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"), TRUE)

inst <- readJPEG(".\\Data\\instructor.jpeg", native = TRUE)
quantile(inst, c(0.30,0.80))

#Question 3

URLQ31 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
URLQ32 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(URLQ31, ".\\Data\\GDPData.csv")
download.file(URLQ32, ".\\Data\\eduData.csv")
GDPdf <- read.csv(".\\Data\\GDPData.csv")
EDUdf <- read.csv(".\\Data\\eduData.csv")
colnames(GDPdf) <- c("CountryCode","Ranking"," ", "Economy","GDP", "ref", " ", 
                     " ", " ", " ")
GDP <- GDPdf[GDPdf$CountryCode != "" & GDPdf$Ranking != "",c("CountryCode",
                                "Ranking", "Economy","GDP", "ref")]
comb <- base::merge(GDP, EDUdf, by.x = "CountryCode", by.y = "CountryCode", 
                    all = FALSE)
#x<-comb[sort(as.numeric(comb$Ranking)),]

a <- select(comb,CountryCode, Ranking, Economy)
b <- mutate(a, Ranking = as.numeric(as.character(Ranking)))
x <- arrange(b,desc(Ranking))
x[13,]

#Question 4
colnames(comb)
a <- filter(comb, Income.Group == "High income: OECD" | 
                    Income.Group == "High income: nonOECD")
b <- group_by(a,Income.Group)
c <- summarise(b,avgGDPRank = mean(as.numeric(as.character(Ranking)), 
                                   na.rm = TRUE))

#Question 5
quantile(as.numeric(as.character(comb$Ranking)))
b < group_by(comb, )

