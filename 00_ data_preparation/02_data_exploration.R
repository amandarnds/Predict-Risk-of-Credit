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
graph_1 <- barplot(fr, xlab="Credit Status (Target Variable)",
                   ylab="Relative Frequency",col=c("seagreen", "yellowgreen"),
                   main="Frequency(%)",ylim = c(0,100))

text(x=c(graph_1), y=fr, labels=fr, pos=3)
box()
graph_1
# As the graph_1, it can see an imbalace of class.However, this only will be 
# treat after the split of dataset. 

#03- Univariate analyses 
#To perform univariate analyses, it will be separete the types of datas in 2 groups

library(dplyr)

#numerical variables 
ds_numerical <- ds %>% select(where(is.numeric))
View(ds_numerical)

#categorical variables 
ds_categorical <- ds %>% select(where(is.factor))
View(ds_categorical)

#Nuerical analyses 
summary(ds_numerical)
#The variables seem to have a normal distribution since the value of mean and 
#median is similar, except for credit amount, where the media seems to higher 
#the median.

#Univariate Analyses
library(ggplot2)

#Duration - Histogram 
ggplot(ds_numerical, aes(x =Duration)) + 
  geom_histogram(aes(y = ..density..),
                 colour = 1, fill = "white") +
  geom_density(lwd = 1, colour = 4,
               fill = 4, alpha = 0.25)+
  ggtitle('Duration Histogram')
#As showed in graph_2 - Duration Histogram, we can see a skewed distribuition.
#Nevertheless, I consider one important variable. 

#Credit Amount - Histogram 
ggplot(ds_numerical, aes(x =CreditAmount)) + 
  geom_histogram(aes(y = ..density..),
                 colour = 1, fill = "white") +
  geom_density(lwd = 1, colour = 4,
               fill = 4, alpha = 0.25)+
  ggtitle('Credit Amount Histogram')
#As showed in graph_3 - Credit Amount Histogram, we can see asymmetric curve to right.

# Installment Rate 
#Since we have a discrete variable, a bar plot
ggplot(ds_numerical, aes(factor(InstallmentRatePecnt), ..count..)) +
  geom_bar( position = "dodge") + xlab("Installment Rates")
#it notice that the rate 4 is bigger. 

#  Present Residence Time 
#Since we have a discrete variable, a bar plot
ggplot(ds_numerical, aes(factor(PresentResidenceTime), ..count..)) +
  geom_bar( position = "dodge") + xlab("Present Residence Time ")
#it notice that the time 4 is bigger. 