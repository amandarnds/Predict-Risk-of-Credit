#Data exploration 

#There are two types of data exploration: univariate and bivariate analyses.

#01-Types of variables 
str(ds)
#As show above, we have two types of variables, categorical and numerical.
# Unique values - It's a important parameter to understand which column is categorical and which one is numerical
# Typically if the number of unique values are < 20 then the variable is likely to be a category otherwise numerical
uv<- apply(ds,2,function(x)length(unique(x)))
uv

