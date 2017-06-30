library(mice)
library(randomForest)
library(reshape2)

args = commandArgs(trailingOnly=TRUE)
print(args[1])
print(args[2])
print(args[3])
file_name = paste('./data/spikeincsv/', args[1], '/', args[2], '.csv', sep='')
X_missing = read.csv(file_name, header=FALSE)[0:10000,]
print(dim(X_missing))
set.seed(23515)
colnames(X_missing) <- c("X1","X2","X3","X4","X5","X6","X7","X8","X9","X10",
                    "X11","X12","X13","X14","X15","X16","X17","X18","X19","X20",
                    "X21","X22","X23","X24","X25","X26","X27","X28","X29","X30", "X31")

tic<-Sys.time()
impMethod<-c("pmm", "norm", "norm.nob", "norm.boot", "norm.predict", "mean", "rf", "ri", "sample")
impList<-list()
ini <- mice(X_missing, maxit = 0)

eval_list<-list()
X = read.csv('./data/completeCasesBoxCox.csv', header=FALSE)[0:10000,2:32]
X.df <- data.frame(matrix(unlist(X)))

for(i in 1:length(impMethod)){
  print(impMethod[i])
  imp <- mice(X_missing, visitSequence = "monotone", predictorMatrix = ini$predictorMatrix, ridge=.3,
              m=1, method = impMethod[i], maxit = 100)
  imputed_matrix <- complete(imp, 1)
  print(dim(imputed_matrix))
  imputed_name <- gzfile(paste('./output/sweeps/', args[1], '/', args[2], '_r_', impMethod[i], '.csv.$
  write.csv(imputed_matrix, file=imputed_name)
}
Sys.time()-tic
