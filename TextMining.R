install.packages("tm")
library(tm)
dataset <- readLines("TMwithR.txt") 
dataset
names(dataset)
summary(dataset)
str(dataset)
head(dataset)
tail(dataset)
mycorpus=Corpus(VectorSource(dataset))
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
mycorpus = tm_map(mycorpus, tolower)
inspect(mycorpus[8])
mycorpus=tm_map(mycorpus, removePunctuation)
inspect(mycorpus[8])
stopwords("en")
dataclean <-tm_map(mycorpus, removeWords, stopwords("english"))
inspect(dataclean[8])
dataset <- tm_map(dataset, stripWhitespace)
