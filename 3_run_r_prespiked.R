library(mice)
library(randomForest)
library(reshape2)

setwd('~/code/imputation/')
args = c("MCAR", "MCAR_0.1_0", "0")
#args = c("TEST", "TEST_0.1", "0")
# args = commandArgs(trailingOnly=TRUE)
print(args[1])
print(args[2])
print(args[3])

file_name = paste('./data/spikeincsv/', args[1], '/', args[2], '.csv', sep='')
X_missing = read.csv(file_name)[1:10000,]
print(dim(X_missing))
set.seed(23515)
#print(head(X_missing))

tic<-Sys.time()
impMethod<-c("pmm", "norm")
#impMethod<-c("pmm", "norm") #, "norm.nob", "norm.boot", "norm.predict", "mean", "rf", "ri", "sample") 
impList<-list()
ini <- mice(X_missing, maxit = 0)

eval_list<-list()
X = read.csv('./data/completeCasesBoxCox.csv')[1:10000,2:32]
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
  
  print(measures-X_missing)
  imputed_name <- paste('./output/sweeps/', args[1], '/', args[2], '_r_', impMethod[i], '.csv', sep='')
  z <- gzfile(paste(imputed_name, ".gz", sep=""))
  write.csv(measures, file=z)
}

Sys.time()-tic