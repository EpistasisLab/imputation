# Using MICE to impute spikeIn datasets
library(mice)
library(randomForest)
library(reshape2)
source("~/Dropbox/BTI/scripts/labwas/LabWAS.Analysis1.functions.R")
load("~/data/imputation/evaluationDatasetBoxCox20161108.Rfile")
load("~/data/imputation/evaluationSpikeInBoxCox20161108.Rfile")

set.seed(23515)
rows<-sample(1:nrow(spikeInSetBoxCox), 10000)
smallEval<-evalSetBoxCox[rows,]
smallSpikeIn<-spikeInSetBoxCox[rows,]

### Run all imputation methods in MICE 
tic<-Sys.time()
impMethod<-c("pmm", "norm", "norm.nob", "norm.boot", "norm.predict", "mean", "rf", "ri", "sample") # quadratic throws warnings glm.fit: algorithm did not converge 
impList<-list()
ini <- mice(smallSpikeIn, maxit = 0)
#corrmat<-cor(smallSpikeIn[,-1], use = "pair")
#predMat<-ini$predictorMatrix[-1,-1]
#predMat[which(abs(corrmat)>.8)]<-0
#ini$predictorMatrix[-1,-1]<-predMat

for(i in 1:length(impMethod)){
print(impMethod[i])
imp <- mice(smallSpikeIn, visitSequence = "monotone", predictorMatrix = ini$predictorMatrix, ridge=.3, m=5, method = impMethod[i], maxit = 100)
impList[[i]]<-imp
}
Sys.time()-tic

### Save the output mids
#save(impList, file ="~/data/imputation/miceImpList.Rdata")

### Assess convergence
#for(i in 1:length(impList)){
#mice.convergence.plot(data=impList[[i]], outfile=paste("~/plots/imputation/miceMethods/miceConvergence_", impMethod[i], "CorLim.8.pdf", sep = ""))
#}

### Compare to results from FancyImpute
### The follwing is derived from "evaluatingResults.R" 

### read in the imputed data that Brett uploaded to DNAnexus
missingSpike<-read.csv("~/Dropbox/Imputation/testDataTop28/completeCasesSpikeInBoxCox.csv", check.names = F)[1:10000,]
missingSpike$ptid<-factor(missingSpike$ptid)
missingSpike<-cbind.data.frame(missingSpike, method=rep("spikeIn", nrow(missingSpike)))
files<-dir("~/Downloads/10k")[-1]

### melt it all into one big data frame
data.long<-melt(missingSpike, id.vars = c("ptid", "method"))
for(i in 1:length(files)){
  splt<-unlist(strsplit(files[i], "[[:punct:]]"))
  measures<-read.csv(paste("~/Downloads/10k/", files[i], sep=""), header=F, check.names = F)
  if(splt[2]=="input"){
    measures<-measures[1:10000,]
  }
  measures<-cbind.data.frame(missingSpike$ptid, measures, rep(splt[2], nrow(measures)))
  colnames(measures)<-colnames(missingSpike)
  measures<-melt(measures,  c("ptid", "method"))
  data.long<-rbind.data.frame(data.long, measures)
}

### Take the various MICE imputation datasets and add them to data.long
### Since I took a random sample of the 100,000 patient spike in set, the ptid's are different so we cannot do a 1 to 1 comparison.
miceMissingSpike<-cbind.data.frame(smallSpikeIn, method=rep("miceSpikeIn", nrow(smallSpikeIn)))
miceInput<-cbind.data.frame(smallEval, method=rep("miceInput", nrow(smallEval)))
miceMissingSpike$ptid<-factor(miceMissingSpike$ptid)
miceInput$ptid<-factor(miceInput$ptid)


mice.data.long<-rbind.data.frame(melt(miceMissingSpike, id.vars = c("ptid", "method")), melt(miceInput, id.vars = c("ptid", "method")))

for(i in 1:length(impList)){
  splt<-impList[[i]]$method[1]
  impValues<-impList[[i]]$imp
  measures<-smallSpikeIn
  for(j in 1:length(impValues)){
    measures[which(is.na(measures[,j])),j]<-impValues[[j]][,1]
  }
  measures<-cbind.data.frame(measures, rep(splt, nrow(measures)))
  colnames(measures)<-colnames(miceInput)
  measures<-melt(measures,  c("ptid", "method"))
  mice.data.long<-rbind.data.frame(mice.data.long, measures)
}



### Make plots for fancy impute methods
spike<-subset(data.long, method=="spikeIn")
imputed<-is.na(spike$value)
imputed<-rep(as.numeric(imputed), i+1)
data.long$imputed<-imputed
input<-subset(data.long, method=="input")
original<-rep(input$value, i+1)
data.long$original<-original
data.long$method<-factor(data.long$method, levels = c("spikeIn", "input", "simpleMean", "simpleMedian", "MICE", "si4", "knn30", "knn15", "knn9", "knn3", "knn1", "svd24", "svd16", "svd8", "svd4", "matrix"))

for(i in 4:31){
  png(paste("~/plots/imputation/evalution/methodsCompare", levels(data.long$variable)[i], ".png", sep=""), width = 12, height = 14, res = 300, units = "in")
  print(ggplot(subset(data.long, variable==paste(levels(data.long$variable)[i]) & imputed), aes(x=original, y=value))+
          geom_point(alpha=.1)+
          #geom_smooth(method = "lm")+
          facet_wrap(~method, ncol = 4)+
          xlim(c(-3,3))+
          ylim(c(-3,3))+
          ggtitle(paste(levels(data.long$variable)[i]))+
          theme_bw()
  )
  dev.off()
}

png("~/plots/imputation/evalution/RMSEbyMethodAndVariable.png", width = 12, height = 7, res = 300, units = "in")
ggplot(subset(data.long, as.logical(imputed)), aes(x=method, y=(value-original)^2, color=variable))+
  #geom_boxplot(outlier.shape = NA)+
  stat_summary(fun.y = function(y){sqrt(mean(y))}, geom = "point")+
  #ylim(c(0,3))+
  #facet_wrap(~variable, ncol = 7)+
  ggtitle("Root Mean Squared Error By Algorithm and Lab")+
  geom_hline(yintercept = sqrt(2))+
  ylab("RMSE")+
  theme_bw(18)+
  theme(axis.text.x  = element_text(angle=45, vjust=0.5))
dev.off()



### Make plots for mice impute mithods

spike<-subset(mice.data.long, method=="miceSpikeIn")
imputed<-is.na(spike$value)
imputed<-rep(as.numeric(imputed), i+2)
mice.data.long$imputed<-imputed
input<-subset(mice.data.long, method=="miceInput")

original<-rep(input$value, i+2)

mice.data.long$original<-original

#mice.data.long$method<-factor(mice.data.long$method, levels = c("miceSpikeIn", "miceInput", "mean", "sample", "pmm", "norm", "norm.nob", "norm.boot", "norm.predict", "quadratic", "cart", "rf", "ri"))

for(i in 4:31){
  png(paste("~/plots/imputation/evalution/predMatAll/miceMethodsComparePredMatAll", levels(mice.data.long$variable)[i], ".png", sep=""), width = 12, height = 14, res = 300, units = "in")
  print(ggplot(subset(mice.data.long, variable==paste(levels(mice.data.long$variable)[i]) & imputed), aes(x=original, y=value))+
          geom_point(alpha=.1)+
          #geom_smooth(method = "lm")+
          facet_wrap(~method, ncol = 4)+
          xlim(c(-3,3))+
          ylim(c(-3,3))+
          ggtitle(paste(levels(mice.data.long$variable)[i]))+
          theme_bw()
  )
  dev.off()
}

png("~/plots/imputation/evalution/predMatAll/miceRMSEbyMethodAndVariable.png", width = 12, height = 7, res = 300, units = "in")
ggplot(subset(mice.data.long, as.logical(imputed) & method!="quadratic"), aes(x=method, y=(value-original)^2, color=variable))+
  #geom_boxplot(outlier.shape = NA)+
  stat_summary(fun.y = function(y){sqrt(mean(y))}, geom = "point")+
  #ylim(c(0,3))+
  #facet_wrap(~variable, ncol = 7)+
  ggtitle("Root Mean Squared Error By Algorithm and Lab")+
  geom_hline(yintercept = sqrt(2))+
  ylab("RMSE")+
  theme_bw(18)+
  theme(axis.text.x  = element_text(angle=45, vjust=0.5))
dev.off()











#impLessThan.5 <- mice(noIDs, predictorMatrix = ini$predictorMatrix, visitSequence = "monotone", maxit = 30)
#impLessThan.8 <- mice(noIDs, visitSequence = "monotone", maxit = 120)
#imp2 <- mice.mids(imp,  maxit = 100)
#save(imp, file="~/Dropbox/BTI/LAB_WAS/dataFiles/imp160623.R")

hist(imp$nmis, breaks=100, main="Missingness of Patients By Lab", xlab="Number of Patients Missing Per Lab")

noDem<-complete(imp)[,-c(30:32)]
corrmat<-cor(noDem)



imp1<-imp$data
for(i in 5:32){
  NAi<-which(is.na(smallSpikeIn[,i]))
  imp1[NAi,i]<-imp$imp[[i]][,5]
}

rmse(smallEval[is.na(smallSpikeIn[,i]),i]-imp1[is.na(smallSpikeIn[,i]),i])


