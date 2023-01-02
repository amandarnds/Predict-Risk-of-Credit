# 01 - Searching Directory 
setwd("F:/github/r/Predict-Risk-of-Credit")
getwd()

# 02 - Coleting the dataset  
ds<- data.frame(read.csv("credit.csv",header =TRUE, stringsAsFactors = TRUE))
View(ds)

#03 - checking dimension
dim(ds)

#04 - name the columns 
colnames(ds)<- c("CheckingAcctStat","Duration", "CreditHistory","Purpose",
                 "CreditAmount","SavingsBonds","Employment", "InstallmentRatePecnt",
                 "SexAndStatus", "OtherDetorsGuarantors","PresentResidenceTime", 
                 "Property","Age","OtherInstallments","Housing","ExistingCreditsAtBank", 
                 "Job","NumberDependents","Telephone","ForeignWorker", "CreditStatus")

#05 - general information 
dim(ds)
str(ds)

#06 - Distribution of target variable

#absolute frequency
fa<- table(ds$CreditStatus)

#relative frequency
fr<- round((prop.table(fa))*100)
fr
#barplot
graph_1 <- barplot(fr, xlab="Credit Status (Target Variable)",
        ylab="Relative Frequency",col=c("seagreen", "yellowgreen"),
        main="Frequency(%)",ylim=c(0, lim*1.15))
text(x=c(graph_1), y=fr, labels=fr, pos=3)
lim <- par()$usr[4]
box()
#When we performing Classification,we have to make sure that 
#there is a balance in the the distribution of each class,
#otherwise it impacts the Machine Learning algorithms ability to learn all the classe.
#As shown at the graph graph_1 _Frequency of target variable,
#we have the class are unbalanced. Therefore, it will be necessary fix it.

#07 - Balancing the dataset 

# To balance the datset, it'll be used the  oversampling technique with
# the ROSE package,where the minority class ("2") will be increased
library(ROSE)
ds1 <- ROSE(CreditStatus ~ ., data = ds, seed = 1)$data
dim(ds1)
View(ds1)

fr1<- round(prop.table(table(ds1$CreditStatus))*100)
fr1
#Graph
graph_2 <- barplot(fr1, main="Frequency (%)",
                   col=c("darkblue", "lightblue"),
                   xlab="Credit Status (Target Variable)",
                   ylab="Relative Frequency",ylim = c(0, 90))
text(fr1, x=c(graph_2), y=fr, labels=fr, pos=3)
#As showed in the graph_2,, we have a balanced dataset now