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