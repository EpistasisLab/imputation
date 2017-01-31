### The pmm method shows a lot of promise but we need to check the donors and ridge parameter ranges
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
donors<-c(3,5,8,11,15,20,30)
ridges<-c(0.5, 0.2, 0.1, 0.01, 0.001, 0.0001, 0.00001, 0.000001)
impList<-list()
ini <- mice(smallSpikeIn, maxit = 0)
#corrmat<-cor(smallSpikeIn[,-1], use = "pair")
#predMat<-ini$predictorMatrix[-1,-1]
#predMat[which(abs(corrmat)>.8)]<-0
#ini$predictorMatrix[-1,-1]<-predMat

loop<-1
for(don in 1:length(donors)){
  for(rid in 1:length(ridges)){
    print(loop)
    imp <- mice(smallSpikeIn, visitSequence = "monotone", predictorMatrix = ini$predictorMatrix, m=5, method = "pmm", donors=donors[don], ridge=ridges[rid], maxit = 20)
    impList[[loop]]<-imp
    loop<-loop+1
  }
}
Sys.time()-tic

### Save the output mids
#save(impList, file ="~/data/imputation/miceImpList.Rdata")

### Assess convergence
#for(i in 1:length(impList)){
#mice.convergence.plot(data=impList[[i]], outfile=paste("~/plots/imputation/miceMethods/miceConvergence_", impMethod[i], "CorLim.8.pdf", sep = ""))
#}


### Combine all the imputation chain 1's into one melted data frame
miceMissingSpike<-cbind.data.frame(smallSpikeIn, method=rep("miceSpikeIn", nrow(smallSpikeIn)))
miceInput<-cbind.data.frame(smallEval, method=rep("miceInput", nrow(smallEval)))
miceMissingSpike$ptid<-factor(miceMissingSpike$ptid)
miceInput$ptid<-factor(miceInput$ptid)


mice.data.long<-rbind.data.frame(melt(miceMissingSpike, id.vars = c("ptid", "method")), melt(miceInput, id.vars = c("ptid", "method")))

loop<-1
for(don in 1:length(donors)){
  for(rid in 1:length(ridges)){
  splt<-impList[[loop]]$method[1]
  ridge<-ridges[rid]
  donor<-donors[don]
  impValues<-impList[[loop]]$imp
  measures<-smallSpikeIn
  for(j in 1:length(impValues)){
    measures[which(is.na(measures[,j])),j]<-impValues[[j]][,1]
  }
  measures<-cbind.data.frame(measures, rep(paste(splt, ridge, "_",donor, sep = ""), nrow(measures)))
  colnames(measures)<-colnames(miceInput)
  measures<-melt(measures,  c("ptid", "method"))
  mice.data.long<-rbind.data.frame(mice.data.long, measures)
  loop<-loop+1
  }
}

spike<-subset(mice.data.long, method=="miceSpikeIn")
imputed<-is.na(spike$value)
imputed<-rep(as.numeric(imputed), loop+1)
mice.data.long$imputed<-imputed
input<-subset(mice.data.long, method=="miceInput")

original<-rep(input$value, loop+1)

mice.data.long$original<-original

#mice.data.long$method<-factor(mice.data.long$method, levels = c("miceSpikeIn", "miceInput", "norm.predict0.75", "norm.predict0.5", "norm.predict0.4", "norm.predict0.3", "norm.predict0.2", "norm.predict0.1", "norm.predict0.01", "norm.predict0.001", "norm.predict1e-04", "norm.predict1e-05", "norm.predict1e-06"))

for(i in 4:31){
  png(paste("~/plots/imputation/evalution/pmm/miceImpPmmDonorsRidgesCompare", levels(mice.data.long$variable)[i], ".png", sep=""), width = 16, height = 16, res = 300, units = "in")
  print(ggplot(subset(mice.data.long, variable==paste(levels(mice.data.long$variable)[i]) & imputed & !method %in% c("miceSpikeIn", "miceInput")), aes(x=original, y=value))+
          geom_point(alpha=.1)+
          #geom_smooth(method = "lm")+
          facet_wrap(~method, ncol = 8)+
          xlim(c(-3,3))+
          ylim(c(-3,3))+
          ggtitle(paste(levels(mice.data.long$variable)[i]))+
          theme_bw()
  )
  dev.off()
}

png("~/plots/imputation/evalution/pmm/micePmmRMSEbyRidgeAndDonorParameter.png", width = 16, height = 9, res = 300, units = "in")
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
