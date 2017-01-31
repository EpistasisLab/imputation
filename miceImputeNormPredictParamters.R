### The MICE linear regression imputation (norm predict) seems promising but we need to try some different ridge parameters
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
ridges<-c(0.75, 0.5, 0.4, 0.3, 0.20, 0.1, 0.01, 0.001, 0.0001, 0.00001, 0.000001)
impList<-list()
ini <- mice(smallSpikeIn, maxit = 0)
corrmat<-cor(smallSpikeIn[,-1], use = "pair")
predMat<-ini$predictorMatrix[-1,-1]
predMat[which(abs(corrmat)>.8)]<-0
ini$predictorMatrix[-1,-1]<-predMat

loop<-1

  for(rid in 1:length(ridges)){
    print(loop)
    imp <- mice(smallSpikeIn, visitSequence = "monotone", predictorMatrix = ini$predictorMatrix, m=5, method = "norm.predict", ridge=ridges[rid], maxit = 50)
    impList[[loop]]<-imp
    loop<-loop+1
  }

Sys.time()-tic

### Save the output mids
#save(impList, file ="~/data/imputation/miceImpNormPredictParameters.Rdata")

### Assess convergence
#for(i in 1:length(impList)){
#mice.convergence.plot(data=impList[[i]], outfile=paste("~/plots/imputation/miceMethods/miceNormPredConvergeRidge", ridges[i], "CorLim.8.pdf", sep = ""))
#}

### Combine all the imputation chain 1's into one melted data frame
miceMissingSpike<-cbind.data.frame(smallSpikeIn, method=rep("miceSpikeIn", nrow(smallSpikeIn)))
miceInput<-cbind.data.frame(smallEval, method=rep("miceInput", nrow(smallEval)))
miceMissingSpike$ptid<-factor(miceMissingSpike$ptid)
miceInput$ptid<-factor(miceInput$ptid)


mice.data.long<-rbind.data.frame(melt(miceMissingSpike, id.vars = c("ptid", "method")), melt(miceInput, id.vars = c("ptid", "method")))

for(i in 1:length(impList)){
  splt<-impList[[i]]$method[1]
  ridge<-ridges[i]
  impValues<-impList[[i]]$imp
  measures<-smallSpikeIn
  for(j in 1:length(impValues)){
    measures[which(is.na(measures[,j])),j]<-impValues[[j]][,1]
  }
  measures<-cbind.data.frame(measures, rep(paste(splt, ridge, sep = ""), nrow(measures)))
  colnames(measures)<-colnames(miceInput)
  measures<-melt(measures,  c("ptid", "method"))
  mice.data.long<-rbind.data.frame(mice.data.long, measures)
}

spike<-subset(mice.data.long, method=="miceSpikeIn")
imputed<-is.na(spike$value)
imputed<-rep(as.numeric(imputed), i+2)
mice.data.long$imputed<-imputed
input<-subset(mice.data.long, method=="miceInput")

original<-rep(input$value, i+2)

mice.data.long$original<-original

mice.data.long$method<-factor(mice.data.long$method, levels = c("miceSpikeIn", "miceInput", "norm.predict0.75", "norm.predict0.5", "norm.predict0.4", "norm.predict0.3", "norm.predict0.2", "norm.predict0.1", "norm.predict0.01", "norm.predict0.001", "norm.predict1e-04", "norm.predict1e-05", "norm.predict1e-06"))

for(i in 4:31){
  png(paste("~/plots/imputation/evalution/miceImpNormPredRidgeCompare", levels(mice.data.long$variable)[i], ".png", sep=""), width = 12, height = 14, res = 300, units = "in")
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

png("~/plots/imputation/evalution/miceNormPredRMSEbyRidgeParameter.png", width = 12, height = 7, res = 300, units = "in")
ggplot(subset(mice.data.long, as.logical(imputed)), aes(x=method, y=(value-original)^2, color=variable))+
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
