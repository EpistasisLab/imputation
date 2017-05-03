library(mice)
library(randomForest)
library(reshape2)

args = commandArgs(trailingOnly=TRUE)
print(args[1])
print(args[2])
print(args[3])
file_name = paste('./data/spikeincsv/', args[1], '/', args[2], '.csv', sep='')
#file_name = paste('./data/spikeincsv/MATCH/part_1.csv')
X_missing = read.csv(file_name, header=TRUE)[0:10000,3:32]
print(dim(X_missing))
set.seed(23515)

tic<-Sys.time()
impMethod<-c("pmm", "norm", "norm.nob", "norm.boot", "norm.predict", "mean", "rf", "ri", "sample")
impList<-list()
ini <- mice(X_missing, maxit = 0)
predMat<-ini$predictorMatrix[-1,-1]
predToRemove<-c('X751.8', 'X30239.8', 'X13457.7', 'X787.2', 'X718.7', 'X4544.3')
predMat[ , which(colnames(predMat) %in% predToRemove)] <- 0
ini$predictorMatrix[-1,-1]<-predMat                         

eval_list<-list()
real_file = paste('./data/spikeincsv/', args[2], '.csv', sep='')
X = read.csv(real_file, header=TRUE)[0:10000,3:32]
X.df <- data.frame(matrix(unlist(X)))

for(i in 1:length(impMethod)){
  print(impMethod[i])
  
  imp <- mice(X_missing, visitSequence = "monotone", predictorMatrix = ini$predictorMatrix, ridge=.3,
              m=1, method = impMethod[i], maxit = 100)
  imputed_matrix <- complete(imp, 1)
  print(dim(imputed_matrix))
  imputed_name <- gzfile(paste('./output/sweeps/', args[1], '/', args[2], '_r_', impMethod[i], '.csv.gz', sep=''))
  write.csv(imputed_matrix, file=imputed_name)
}
Sys.time()-tic
