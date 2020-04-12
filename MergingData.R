
#peer review data
if(!file.exists(".\\Data")){dir.create(".\\Data")}
fileURL1 = "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/reviews.csv"
fileURL2 = "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/solutions.csv"
download.file(fileURL1,destfile = ".\\Data\\reviews.csv")
download.file(fileURL2,destfile = ".\\Data\\solutions.csv")
reviews <- read.csv(".\\Data\\reviews.csv")
solutions <- read.csv(".\\Data\\solutions.csv")
head(reviews,2)
head(solutions,2)

names(reviews)
names(solutions)

mergedData = merge(reviews, solutions, by.x = "solution_id", by.y = "id", 
                   all = TRUE)
head(mergedData)

intersect(names(reviews), names(solutions))

mergedData2 = merge(reviews,solutions, all= TRUE)
head(mergedData2)

df1 = data.frame(id = sample(1,10,replace = TRUE), x = rnorm(10))
df2 = data.frame(id = sample(1,10,replace = TRUE), y = rnorm(10))
df3 = data.frame(id = sample(1,10,replace = TRUE), z = rnorm(10))
arrange(join(df1,df2),id)
dfList = list(df1, df2, df3)
join_all(dfList)


