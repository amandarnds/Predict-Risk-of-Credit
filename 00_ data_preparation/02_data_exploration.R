#Data exploration 

#There are two types of data exploration: univariate and bivariate analyses.

#01-Types of variables 
str(ds)
#As show above, we have two types of variables, categorical and numerical.
# Unique values - It's a important parameter to understand which column is categorical and which one is numerical
# Typically if the number of unique values are < 20 then the variable is likely to be a category otherwise numerical
uv<- apply(ds,2,function(x)length(unique(x)))
uv

#02 - Identify the target variable
#The target variable is "CreditStatus", that show the risk of credit for customers
#We have a binary data 1 is good and 2 is bad,as show in"graph_1 _Frequency of target variable". 

#Absolute frequency 
fa<- table(ds$CreditStatus)

#Relative frequency
fr<- round((prop.table(fa))*100)
fr

#barplot
library(ggplot2)
graph_1 <- barplot(fr, xlab="Credit Status (Target Variable)",
                   ylab="Relative Frequency",col=c("seagreen", "yellowgreen"),
                   main="Frequency(%)",ylim=c(0, lim*10))
text(x=c(graph_1), y=fr, labels=fr, pos=3)
box()

#03- Univariate analyses 
#To perform univariate analyses, it will be separete the types of datas in 2 groups

library(dplyr)

#numerical variables 
ds_numerical <- ds %>% select(where(is.numeric))
View(ds_numerical)

#categorical variables 
ds_categorical <- ds %>% select(where(is.factor))
View(ds_categorical)

