#load files
files.list<-list.files()
total<-vector()
for(i in files.list){
file<-scan(file=i, what="", encoding="", sep=" ")
file<-unlist(strsplit(file, " "))
file<-file[nchar(file)>0]
total<-c(total, i, file)
}


#make stopwords list and exclude them from total words
stopwords<-c("/w$|/u$|/c$|/p$|/vl$|/m$|/q$")
content<-total[-grep(stopwords, total)]
number.index<-grep("/m$", content)
content[number.index]<-"00/m"
content.df<-data.frame(sort(table(content), decreasing=T))
head(content.df, 30)

#set new working directory
fileNameIndex<-grep("[.]txt", content)
for(j in 1:length(fileNameIndex)){
m<-fileNameIndex[j]+1
n<-fileNameIndex[j+1]-1
if(is.na(n)){
n<-length(content)
}
cat(content[m], " ", content[n], "\n")
cat(content[m:n], file=content[m-1], sep=" ")
}
