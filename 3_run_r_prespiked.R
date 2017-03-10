library(mice)
library(randomForest)
library(reshape2)

args = commandArgs(trailingOnly=TRUE)
print(args[1])
print(args[2])
print(args[3])
file_name = paste('./data/spikeincsv/', args[1], '/', args[2], '.csv', sep='')
X_missing = read.csv(file_name)[1:10000,]
print(dim(X_missing))
set.seed(23515)
#print(head(X_missing))

tic<-Sys.time()
impMethod<-c("pmm", "norm", "norm.nob", "norm.boot", "norm.predict", "mean", "rf", "ri", "sample") 
impList<-list()
ini <- mice(X_missing, maxit = 0)

eval_list<-list()
X = read.csv('./data/completeCasesBoxCox.csv')[1:10000,2:32]
X.df <- data.frame(matrix(unlist(X)))

for(i in 1:length(impMethod)){
  print(impMethod[i])
  imp <- mice(X_missing, visitSequence = "monotone", predictorMatrix = ini$predictorMatrix, ridge=.3,
              m=1, method = impMethod[i], maxit = 100)
  impList[[i]]<-imp
  
  splt<-imp$method[1]
  impValues<-impList[[i]]$imp
  measures<-X_missing
  for (j in 1:length(impValues)){
    measures[which(is.na(measures[,j])),j]<-impValues[[j]][,1]
  }
  m.df <- data.frame(matrix(unlist(measures)))
  eval_list[i] = sqrt(mean((m.df-X.df)^2))
  
  if (args[3] == "1") {
    imputed_matrix <- matrix(m.df, ncol=31, byrow=FALSE)
    imputed_name <- paste('./output/sweeps/', args[2], '_r_', impMethod[i], '.csv', sep='')
    write.csv(imputed_matrix, file=imputed_name)
  }
}
Sys.time()-tic

file_name <- paste('./output/scores/', args[1],'R_', args[2], '.csv', sep='')
print(file_name)
eval.df <- data.frame(matrix(unlist(eval_list)))
rownames(eval.df) <- impMethod
write.csv(eval.df, file=file_name)
