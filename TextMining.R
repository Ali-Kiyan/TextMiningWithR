install.packages("tm")
library(tm)
options(header=FALSE,stringasfactors = FALSE,FileEncoding = "latin1")
dataset <- readLines("TMwithR.txt") 
dataset
names(dataset)
summary(dataset)
str(dataset)
head(dataset)
tail(dataset)
mycorpus = Corpus(VectorSource(dataset))
#converting the text file to corpus
#The main structure for managing documents in tm package is called Corpus
mycorpus
inspect(mycorpus[1])
inspect(mycorpus[2])
inspect(mycorpus[3])
inspect(mycorpus[4])
inspect(mycorpus[5])
inspect(mycorpus[8])
mycorpus[8] 
#
stopwords("en")

dataclean = tm_map(mycorpus,removeWords, stopwords('english'))
mycorpus = tm_map(mycorpus,content_transformer(function(x) iconv(x, to='UTF8', sub='byte')))
inspect(mycorpus[8])
mycorpus=tm_map(mycorpus, removePunctuation)
inspect(mycorpus[8])
mycorpus=tm_map(mycorpus,removeNumbers)
mycorpus = tm_map(mycorpus, tolower)
inspect(mycorpus[8])
inspect(dataclean[8])
mycorpus <- tm_map(mycorpus, stripWhitespace)
dtm=TermDocumentMatrix(mycorpus, control = list(minWordLength=c(1,Inf)))
findFreqTerms(dtm,lowfreq =2)
as.matrix(dtm)
termFrequency = rowSums(as.matrix(dtm))
termFrequency
termFrequency=subset(termFrequency, termFrequency>=15)
termFrequency
#las makes the lables perpendicular to axix rainbow is color 
barplot(termFrequency, las=2,col=rainbow(20))

