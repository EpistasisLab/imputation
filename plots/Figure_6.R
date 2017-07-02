### Look at the variation between different imputations for different methods in the mice package
library(ggplot2)
library(reshape2)
library(plyr)
library(dplyr)
library(magrittr)

load("/data/miceImpList6zeroColumns.Rdata")
load("/data/evaluationDatasetBoxCox20161108.Rfile")
load("/data/evaluationSpikeInBoxCox20161108.Rfile")

set.seed(23515)
rows<-sample(1:nrow(spikeInSetBoxCox), 10000)
smallEval<-evalSetBoxCox[rows,]
smallSpikeIn<-spikeInSetBoxCox[rows,]

variabilityTable<-data.frame(matrix( nrow = 0, ncol = 6))
colnames(variabilityTable)<-c("method","variable","m.iter","RMSEobs","RMSEimp")

for(i in 1:length(impList)){
  print(paste("imputation set #", i))
  imp<-impList[[i]]
  impValues<-impList[[i]]$imp
  for(k in 5:length(impValues)){
    for(m.iter in 1:impList[[i]]$m){
      obs<-smallEval[which(is.na(smallSpikeIn[,k])),k]
      imp.m<-impValues[[k]][,m.iter]
      comp<-sample((1:impList[[i]]$m)[-m.iter], size = 1)
      imp.Comp<-impValues[[k]][,comp]
      RMSEobs<-sqrt(mean((imp.m-obs)^2))
      RMSEimp<-sqrt(mean((imp.m-imp.Comp)^2))

      new.row<-cbind.data.frame(imp$method[1], names(impValues)[k], m.iter, RMSEobs, RMSEimp)
      variabilityTable<-rbind(variabilityTable, new.row)
    }
  }
}

print("Making Variability Table")
colnames(variabilityTable)<-c("method", "variable", "m.iter", "RMSEobs", "RMSEimp")
variabilityTable$method<-factor(variabilityTable$method, levels = c("norm",  "pmm", "sample", "rf", "norm.predict", "mean", "ri",  "norm.boot", "norm.nob"))
variabilityTable<-variabilityTable[order(variabilityTable$method), ]

r2v<-vector()
x<-vector()
y<-vector()

print("Made Variability Table")
for(i in levels(variabilityTable$method)){
  data.sub<-subset(variabilityTable, method==i)
  #params<-summary(lm(RMSEobs ~ RMSEimp, data.sub))
  r2<-sqrt(mean((data.sub$RMSEobs-data.sub$RMSEimp)^2))
  r2<-sprintf("%.2f", round(r2, 3))
  add.r2<-rep(r2, nrow(data.sub))
  r2v<-c(r2v, add.r2)
  x.add<-rep(min(data.sub$RMSEobs)+(max(data.sub$RMSEobs)-min(data.sub$RMSEobs))*.22, nrow(data.sub))
  y.add<-rep(max(data.sub$RMSEimp)-(max(data.sub$RMSEobs)-min(data.sub$RMSEobs))*.1, nrow(data.sub))
  y.add<-rep(max(data.sub$RMSEimp), nrow(data.sub))
  if(i %in% c("mean", "norm.predict")){
    y.add<-rep(.01, nrow(data.sub))
  }
  x<-c(x, x.add)
  y<-c(y, y.add)
}

variabilityTable$r2<-r2v
variabilityTable$x<-x
variabilityTable$y<-y

input<-evalSetBoxCox[1:10000,-1]
inputLong<-melt(input)
spike<-spikeInSetBoxCox[1:10000,-1]
spikeLong<-melt(spike)
missing.i<-which(is.na(spikeLong$value))

folders<-c("/data/10k2/", "/data/output/")
methodsToCompare<-intersect(dir(folders[1]), dir(folders[2]))
methodsSummaryStats<-data.frame(matrix(nrow=0,ncol = 5))

print("Intersect input and different imputations")
for(i in 1:length(methodsToCompare)){
  f1<-read.table(paste(folders[1], methodsToCompare[i], sep = ""), header = F, sep = ",")
  f2<-read.table(paste(folders[2], methodsToCompare[i], sep = ""), header = F, sep = ",")
  colnames(f1)<-colnames(f2)<-colnames(input)
  f1Long<-melt(f1)
  f2Long<-melt(f2)
  chunk<-cbind(rep(methodsToCompare[i], length(missing.i)) , inputLong[missing.i,], f1Long$value[missing.i], f2Long$value[missing.i])
  methodsSummaryStats<-rbind(methodsSummaryStats, chunk)
}
colnames(methodsSummaryStats)<-c("method", "variable", "original", "imp1", "imp2")
methodsSummaryStats$method<-gsub(pattern = "completeCasesBoxCox_", replacement = "", x = methodsSummaryStats$method)
methodsSummaryStats$method<-factor(methodsSummaryStats$method)

gd <- methodsSummaryStats %>%
  group_by(variable, method) %>%
  summarise(
    x = sqrt(mean((imp1-original)^2)),
    y = sqrt(mean((imp1-imp2)^2))
  )
gd<-data.frame(method=gd$method, variable=gd$variable, m.iter=rep(1, nrow(gd)), RMSEobs=gd$x, RMSEimp=gd$y)
gd<-gd[order(gd$method),]

r2v<-vector()
x<-vector()
y<-vector()
for(i in levels(gd$method)){
  data.sub<-subset(gd, method==i)
  #params<-summary(lm(RMSEobs ~ RMSEimp, data.sub))
  r2<-sqrt(mean((data.sub$RMSEobs-data.sub$RMSEimp)^2))
  r2<-sprintf("%.2f", round(r2, 3))
  add.r2<-rep(r2, nrow(data.sub))
  r2v<-c(r2v, add.r2)
  x.add<-rep(min(data.sub$RMSEobs)+(max(data.sub$RMSEobs)-min(data.sub$RMSEobs))*.22, nrow(data.sub))
  y.add<-rep(max(data.sub$RMSEimp)-(max(data.sub$RMSEobs)-min(data.sub$RMSEobs))*.1, nrow(data.sub))
  y.add<-rep(max(data.sub$RMSEimp), nrow(data.sub))
  if(i %in% c("knn_751.csv", "si_s_8.csv", "simple_median.csv", "svd_2.csv")){
    y.add<-rep(.01, nrow(data.sub))
  }
  x<-c(x, x.add)
  y<-c(y, y.add)
}
gd$r2<-r2v
gd$x<-x
gd$y<-y

all.results<-rbind(variabilityTable, gd)
methodsComp<-c("norm", "pmm", "sample", "rf", "mice_pmm_lambda_reg_001.csv", "mice_col_lambda_reg_1.csv", "norm.predict", "si_s_8.csv", "knn_751.csv", "mean", "simple_median.csv",  "svd_2.csv")
sub.results<-subset(all.results, method %in% methodsComp)

sub.results$method<-factor(sub.results$method, levels = methodsComp)
sub.results<-sub.results[order(sub.results$method),]
sub.results$method<-mapvalues(sub.results$method, from=methodsComp, to=c("MICE Norm (R)","MICE pmm (R)","Random Sample (R)","MICE RF (R)","MICE pmm (FI)","MICE col (FI)","MICE norm.pred (R)","SoftImpute (FI)","KNN (FI)","Mean (R)","Median (R)"," SVD (FI)"))

p1<-ggplot(sub.results, aes(x=RMSEobs, y=RMSEimp, col=variable))+
  geom_point()+
  facet_wrap( ~ method, ncol = 4, scales = "free")+
  xlab("RMSE vs observed")+
  ylab("RMSE vs imputed")+
  #xlim(0, max(c(variabilityTable$RMSEobs, variabilityTable$RMSEimp)))+
  #ylim(0, max(c(variabilityTable$RMSEobs, variabilityTable$RMSEimp)))+
  geom_abline(slope = 1, intercept = 0)+
  scale_color_discrete("LOINC Code")+
  #ggtitle("Error Vs. Variability")+
  theme_bw()


rsqs<-paste0("MD ==", sub.results$r2)

png("./figures/figure_5.png", res = 300, width = 12, height = 7, units = "in")
p1+geom_text(aes(x=sub.results$x, y=sub.results$y, label=as.character(rsqs)), parse = TRUE, size=4, col="black")
dev.off()
