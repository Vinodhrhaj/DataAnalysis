#LINEAR

practice1<-read.csv(file.choose())
head(practice1)
prac=lm(Salary~EducLev+JobGrade+Gender+YrsPrior, data=practice1)
summary(prac)
practice1$EducLev <- as.factor(practice1$EducLev)
practice1$JobGrade <- as.factor(practice1$JobGrade)

practice2=read.csv(file.choose())
head(practice2)
practice2$salarypadult<-ifelse((practice2$Married==1),practice2$Salary/2,practice2$Salary)
head(practice2)
practice2$singlemother=ifelse((practice2$Gender==0)&(practice2$Married==0)&(practice2$Children>=1),1, 0)
tail(practice2)
practice2$Singlefather=ifelse((practice2$Gender==1)&(practice2$Married==0)&(practice2$Children>=1),1, 0)
practice2
prac2=lm(AmountSpent~Salary+Catalogs+singlemother+Singlefather, data=practice2)
summary(prac2)

#NAIVE BAYES
Opt<- read.csv(file.choose())
head(Opt)
Opt$OptDigit1 <- as.factor(Opt$OptDigit1)
tempopt=Opt
trainopt <- tempopt[1:2810,]
testopt <- tempopt[2810:5620,]
library ("klaR")
library ("caret")
library ("e1071")
library(e1071)
for(i in 1:10)
  
{
  classifier=naiveBayes(OptDigit1 ~ ., data = trainopt)
  Test=predict(classifier,testopt)
  c=confusionMatrix(testopt$OptDigit1,Test)
  print(c$overall["Accuracy"])
}


#LOGISTIC

Opt$OptDigit1 = as.factor(Opt$OptDigit1)
LLR=glm(OptDigit1~., data=Opt, family=binomial(link='logit'))
summary(LLR)
DP=predict(LLR,Opt, type='response')
summary(DP)
table(Opt$OptDigit1, DP>0.5)

#BootStrapping

# Read in SP500 weekly data
SP500 = read.csv(file.choose())
# Create price change column
SP500$Change = SP500$Close/5200

PickRow = sample(1:nrow(SP500),1)
PickRow
PickRate = SP500$Change[PickRow]
PickRate

getSampleReturn = function() {
  PickRow = sample(1:nrow(SP500),1)
  SP500$Change[PickRow]
}
companybalance1=0
eAmtsum=0
for (i in c(1:10)){
  
  bAmt = 1000
  
  
  iRate = getSampleReturn()
  eAmt = bAmt * (1+iRate)
  loadweekly=eAmt*(0.01/52)
  mybalance=eAmt-loadweekly
  companybalance=loadweekly
  investment = data.frame(week=1, bAmt = bAmt, iRate = iRate, eAmt = eAmt,companybalance=companybalance )
  
  for (w in c(2:260)) {
    
    bAmt = eAmt
    iRate = getSampleReturn()
    eAmt = bAmt * (1+iRate)
    loadweekly=eAmt*(0.01/52)
    mybalance=eAmt-loadweekly
    companybalance=(companybalance*(1-iRate))+loadweekly  
    investment = rbind(investment,data.frame(week=w, bAmt = bAmt, iRate=iRate,eAmt = eAmt,companybalance=companybalance))
  }
  
  eAmtsum=eAmtsum+eAmt 
  companybalance1=companybalance1+companybalance
  eAmt=bAmt
  
}
eAmt
companybalance
eAmtsum1=eAmtsum/10
eAmtsum1

companybalance2=companybalance1/10
companybalance2

#RIDGELASSO

#Lass0
library(glmnet)
rl<- read.csv(file.choose())
lasso=rl
x=model.matrix(MR~.,data=rl)
y=rl$MR
cv.lasso=cv.glmnet(x,y)
plot(cv.lasso)
coef(cv.lasso)


#Ridge
cv.ridge=cv.glmnet(x,y,alpha=0)
plot(cv.ridge)
coef(cv.ridge)