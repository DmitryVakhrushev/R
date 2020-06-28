# Working with Short_Churn3.csv
new <- read.table ("C:\\RProjects\\mydata\\Short_Churn3.csv", sep = ",", header = T, nrow = 10)
#attach (new)
new
str (new)
# summary (new)

hist (AccLen, col = "light blue")
hist (DayMins)
hist (DayCalls)
hist (DayCharge)


head (new)
tail (new)


## VISUALIZATION
library (lattice) # uploading the LATTICE library
densityplot (AccLen)
histogram (DayCalls)

#Logic expressions
docs <- c("This is a text.", "This another one.")


##PROGRAM EXAMPLE
# comment: counts the number of odd integers in x

oddcount <- function(x) {
k <- 0
for (n in x) {
if (n %% 2 == 1) k <- k+1
}
return(k)
}
oddcount(c(1,3,5))
oddcount(c(1,2,3,7,9))

ovid <- Corpus(DirSource(txt), readerControl = list(language = "lat")))

reuters <- Corpus(DirSource(reut21578),readerControl = list(reader = readReut21578XML))

Corpus(VectorSource(docs))
ovid
docs


#TEXT MINING

honda <- system.file("texts", "honda", package = "tm")
(mytext <- Corpus(DirSource(honda), encoding = "UTF-8",readerControl = list(language = "lat")))
inspect (mytext)

txt <- system.file("texts", "txt", package = "tm")
(ovid <- Corpus(DirSource(txt), readerControl = list(language = "lat")))

inspect (ovid)

# Converting to Plain Text Documents
ovid <- tm_map(ovid, as.PlainTextDocument)

#Eliminating Punctuation
ovid <- tm_map(ovid, removePunctuation)

#Remove Stopwords
ovid <- tm_map(ovid, removeWords, stopwords("english"))

#Eliminating Extra Whitespace
ovid <- tm_map(ovid, stripWhitespace)

#Convert to Lower Case
ovid <- tm_map(ovid, tolower)

#Stemming
tm_map(ovid, stemDocument)

#Creating Term-Document Matrices
dtm <- DocumentTermMatrix(ovid)
inspect(dtm[1:5, 100:105])
inspect(dtm[])

#Operations on Term-Document Matrices
findFreqTerms(dtm, 3) #where 3 is number of times the word appears

#To remove sparse terms, i.e., terms occurring only in very few documents.
inspect(removeSparseTerms(dtm, 0.4))

findAssocs(dtm, "brake", 0.8)





