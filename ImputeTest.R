library(mice)
library(randomForest)
library(reshape2)

args = commandArgs(trailingOnly=TRUE)
setwd('./data/')
print(args[1])
file_name = paste(args[1], '.csv', sep='')
X_missing = read.csv(file_name)[1:9999,]
print(dim(X_missing))
set.seed(23515)
#print(head(X_missing))

tic<-Sys.time()
#impMethod<-c("pmm", "norm", "norm.nob", "norm.boot", "norm.predict", "mean", "rf", "ri", "sample") # quadratic throws warn$
impMethod<-c("pmm", "norm") # quadratic throws warnings glm.fit: algorithm did not converge
impList<-list()
ini <- mice(X_missing, maxit = 0)

eval_list<-list()
X = read.csv('./completeCasesBoxCox.csv')[1:9999,2:32]
X.df <- data.frame(matrix(unlist(X)))

for(i in 1:length(impMethod)){
  print(impMethod[i])
  imp <- mice(X_missing, visitSequence = "monotone", predictorMatrix = ini$predictorMatrix, ridge=.3,
              m=1, method = impMethod[i], maxit = 1)
  impList[[i]]<-imp
  
  splt<-imp$method[1]
  impValues<-impList[[i]]$imp
  measures<-X_missing
  for (j in 1:length(impValues)){
    measures[which(is.na(measures[,j])),j]<-impValues[[j]][,1]
  }
  m.df <- data.frame(matrix(unlist(measures)))
  eval_list[i] = sqrt(mean((m.df-X.df)^2))
}
Sys.time()-tic

file_name <- paste('../output/R', args[1], sep='_')
print(file_name)
eval.df <- data.frame(matrix(unlist(eval_list)))
rownames(eval.df) <- impMethod
write.csv(eval.df, file=file_name)
