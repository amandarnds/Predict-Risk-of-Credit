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
