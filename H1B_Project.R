h1b10000=H1B

H1B

h1b1000=H1B[sample(nrow(H1B)),]
h1b1 <- h1b10000[1:10000,]
head(h1b1)
h1b1
h1breg1=lm(YEAR~EMPLOYER_NAME,data=h1btest1)
h1btest1$SOC_NAME <- gsub("*(manage)*", "Manager", ignore.case = TRUE,h1btest1$SOC_NAME)
h1btest1$SOC_NAME
library(xlsx)
write.xlsx(h1b1, "V:/Statistical Data mining/h1b1.xlsx")
write.table(h1b1, "V:/Statistical Data mining/h1b1.txt", sep="\t")


H1BCLEAN<-read.csv(file.choose())
head(H1BCLEAN)
clean=H1BCLEAN
clean$YEAR <- as.factor(clean$YEAR)
h1breg1=lm(CASE_STATUS~.-PREVAILING_WAGE,data=clean)
library(e1071)

#NAIVE BAYES
classifier=naiveBayes(CASE_STATUS~.,data=clean)
summary(classifier)
Test=predict(classifier,clean)
library ("klaR")
library ("caret")
library ("e1071")
c1=confusionMatrix(clean$CASE_STATUS,Test)
c1
print(c1$overall["Accuracy"])

#LOGISTIC
clean_log$CASE_STATUS<-ifelse(clean_log$CASE_STATUS=="CERTIFIED",1,0)
clean_log$CASE_STATUS=as.factor(clean_log$CASE_STATUS)
clean_log= clean
logh1b=glm(CASE_STATUS~., family=binomial(link="logit"), data=clean_log)
summary(logh1b)

head(clean_log)
correl(CASE_STATUS,Employee)

h1blogpred=predict(logh1b,clean_log, type='response')
table(clean_log$CASE_STATUS, h1blogpred>0.5)
clean_log$CASE_STATUS<-ifelse(clean_log$CASE_STATUS="CERTIFIED",1,0)
clean_log$CASE_STATUS <- gsub(1, "CERTIFIED", ignore.case = TRUE,clean_log$CASE_STATUS)
clean_log
confusionMatrix(clean$CASE_STATUS,h1blogpred)



#REG 2

H1BCLEAN2<-read.csv(file.choose())
head(H1BCLEAN2)
clean2=H1BCLEAN2
clean3$YEAR <- as.factor(clean3$YEAR)

library(e1071)

#NAIVE BAYES
classifier2=naiveBayes(CASE_STATUS~.,data=clean2)
summary(classifier2)
Test2=predict(classifier2,clean2)
library ("klaR")
library ("caret")
library ("e1071")
c2=confusionMatrix(clean2$CASE_STATUS,Test2)
c2
print(c1$overall["Accuracy"])

#LOGISTIC
clean_log$CASE_STATUS<-ifelse(clean_log$CASE_STATUS=="CERTIFIED",1,0)
clean_log$CASE_STATUS=as.factor(clean_log$CASE_STATUS)
clean_log= clean
logh1b=glm(CASE_STATUS~., family=binomial(link="logit"), data=clean_log)
summary(logh1b)

head(clean_log)
correl(CASE_STATUS,Employee)

h1blogpred=predict(logh1b,clean_log, type='response')
table(clean_log$CASE_STATUS, h1blogpred>0.5)
clean_log$CASE_STATUS<-ifelse(clean_log$CASE_STATUS="CERTIFIED",1,0)
clean_log$CASE_STATUS <- gsub(1, "CERTIFIED", ignore.case = TRUE,clean_log$CASE_STATUS)
clean_log
confusionMatrix(clean$CASE_STATUS,h1blogpred)


#TEST_OVERALL

H1BOVERALL<-read.csv(file.choose())
table(H1BOVERALL$CASE_STATUS)
tail

H1B2016<-read.csv(file.choose())
H1B2016

H1BCOUNT<-read.csv(file.choose())
unique.default(H1BCOUNT$EMPLOYER_NAME)

