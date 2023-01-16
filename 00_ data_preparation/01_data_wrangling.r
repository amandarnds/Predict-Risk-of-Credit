# 01 - Searching Directory 
setwd("F:/github/r/Predict-Risk-of-Credit")
getwd()

# 02 - Coleting the dataset  
ds<- data.frame(read.csv("credit.csv",header =TRUE, stringsAsFactors = TRUE))
View(ds)

#04 - name the columns 
colnames(ds)<- c("CheckingAcctStat","Duration", "CreditHistory","Purpose",
                 "CreditAmount","SavingsBonds","Employment", "InstallmentRatePecnt",
                 "SexAndStatus", "OtherDetorsGuarantors","PresentResidenceTime", 
                 "Property","Age","OtherInstallments","Housing","ExistingCreditsAtBank", 
                 "Job","NumberDependents","Telephone","ForeignWorker", "CreditStatus")

#05 - general information
#dimension
dim(ds)
#types of variables 
str(ds)

#05 - Missing Values 
colSums(is.na(ds))
#No missing values in this data.Therefore,will not be necessary to  treat them.

#06- Duplicate values 
sum(duplicated(ds))
#No duplicated values.So, no action 

#07- Grouped values 
View(ds)
#According with the dataset, we don't have grouped values in the variables. 
