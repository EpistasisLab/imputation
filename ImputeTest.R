library(mice)
library(randomForest)
library(reshape2)

args = commandArgs(trailingOnly=TRUE)
setwd('./data/')
print(args[1])
file_name = paste(args[1], '.csv', sep='')
X_missing = read.csv(file_name)
print(dim(X_missing))
set.seed(23515)
#print(head(X_missing))

tic<-Sys.time()
#impMethod<-c("pmm", "norm", "norm.nob", "norm.boot", "norm.predict", "mean", "rf", "ri", "sample") # quadratic throws warnings glm.fit: algorithm did not converge 
#impMethod<-c("pmm", "norm") # quadratic throws warnings glm.fit: algorithm did not converge 
impList<-list()
ini <- mice(X_missing, maxit = 0)

eval_list<-list()
X = read.csv('./completeCasesBoxCox.csv')[1:9999,2:32]
print(dim(X))

X = X[1:250,]
X_missing = X_missing[1:250,]

X.df <- data.frame(matrix(unlist(X)))

print(args[2])
imp <- mice(X_missing, visitSequence = "monotone", predictorMatrix = ini$predictorMatrix, 
            ridge=.3, m=1, method = args[2], maxit = 100)

impValues<-imp$imp
measures<-X_missing
print(dim(impValues))
print(dim(measures))
for (j in 1:length(impValues)){
  measures[which(is.na(measures[,j])),j]<-impValues[[j]][,1]
}
m.df <- data.frame(matrix(unlist(measures)))
eval_list = sqrt(mean((m.df-X.df)^2))

Sys.time()-tic

file_name <- paste('../output/R', args[1], args[2], '.csv', sep='_')
print(file_name)
eval.df <- data.frame(matrix(unlist(eval_list)))
rownames(eval.df) <- args[2]
write.csv(eval.df, file=file_name)