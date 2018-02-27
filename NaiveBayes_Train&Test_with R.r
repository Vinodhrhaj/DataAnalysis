

#Logistic Regression
head(Default)
DefaultData = Default
DefaultData
head(DefaultData)
D.LR=glm(formula=default~income+balance+student, family=binomial, data=DefaultData)
summary(D.LR)
intercept = D.LR$coefficients[1]
slope = D.LR$coefficients[2]
DP=predict(D.LR,Default, type='response')
table(DefaultData$default, DP>0.5)

#Naive Bayes
library ("klaR")
library ("caret")
library ("e1071")
NB <- naiveBayes(default ~ income+balance+student, data=DefaultData)
predictions <- predict(NB, DefaultData)
table(DefaultData$default, predictions)


#With Datashuffled
wine <- read.csv(file.choose())
head(wine)
wine$Class <- as.factor(wine$Class)
y = wine$Class
x = wine[,-14]
library(e1071)
classifier <- naiveBayes(Class ~ ., data = wine)
summary(classifier)
pred = predict(classifier, x )
table(pred, wine[,14])
tempwine=wine
tempwine=wine[sample(nrow(wine)),]
train <- tempwine[1:89,]
test <- tempwine[90:178,]
train
tail(wine)

#Training_Classifier
train$Class <- as.factor(train$Class)
a = test$Class
b = test[,-14]
library(e1071)
trainclassifier <- naiveBayes(Class ~ ., data = train)
summary(trainclassifier)
pred1 = predict(trainclassifier, b )
table(pred1,test[,14])

#Without Datashuffled
wine <- read.csv(file.choose())
head(wine)
wine$Class <- as.factor(wine$Class)
y = wine$Class
x = wine[,-14]
library(e1071)
classifier <- naiveBayes(Class ~ ., data = wine)
summary(classifier)
pred = predict(classifier, x )
table(pred, wine[,14])
tempwine=wine
#tempwine=wine[sample(nrow(wine)),]
train <- tempwine[1:89,]
test <- tempwine[90:178,]
train
tail(wine)



optdigits<- read.csv(file.choose())
head(optdigits)
optdigits$OptDigit <- as.factor(optdigits$OptDigit)

#Run the model for 10 iterations
for(i in 1:10)
{
tempopt=optdigits[sample(nrow(optdigits)),]
tail(optdigits)
trainopt <- tempopt[1:2810,]
testopt <- tempopt[2810:5620,]
tail(trainopt)
#i = optdigits[,-65]
library(e1071)
classifier3 <- naiveBayes(OptDigit ~ ., data = trainopt)
summary(classifier3)
pred3 = predict(classifier3,testopt)
pred3
c=confusionMatrix(testopt$OptDigit,pred3)
print(c$overall["Accuracy"])
}

#80% train data and 20% test data

optdigits<- read.csv(file.choose())
head(optdigits)
optdigits$OptDigit <- as.factor(optdigits$OptDigit)

#Run the model for 10 iterations
for(i in 1:10)
{
  temp2opt=optdigits[sample(nrow(optdigits)),]
  tail(optdigits)
  train2opt <- temp2opt[1:4496,]
  test2opt <- temp2opt[4497:5620,]
  classifier3b <- naiveBayes(OptDigit ~ ., data = train2opt)
  summary(classifier3b)
  pred3 = predict(classifier3,test2opt)
  pred3
  c2=confusionMatrix(test2opt$OptDigit,pred3)
  print(c2$overall["Accuracy"])
}











