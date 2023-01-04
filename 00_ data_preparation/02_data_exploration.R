
#It will be done a basic data exploration 

#01 - General Information 
#View dataset 
View(ds1)

#dimension
dim(ds1)

#types of variables 
str(ds1)
#As show above, we have two types of variables, categorical and numerical

#Fiding unique values for each columns 
# It's a important parameter to understand which column is categorical and which one is numerical
# Typically if the number of unique values are < 20 then the variable is likely to be a category otherwise numerical
uv<- apply(ds1,2,function(x)length(unique(x)))
uv


#02 - Missing Values 
colSums(is.na(ds1))
#No missing values in this data.Therefore,won´t be necessary to  treat them.

#_______________DETECTION OF PROBLEM______________________
View(ds1)
#As show in the dataset above, we find a problem.
#The numerical variables have been changed.
#To correct them,I transformed as integer
ds2<- ds1 %>% mutate_if(is.numeric,as.integer)
View(ds2)
