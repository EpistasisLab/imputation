# read in Brett's imputed data.
library(reshape2)

predictions<-read.csv("~/code/data/imputation/data/all_patients/all_labs.csv")
print(dim(predictions))
