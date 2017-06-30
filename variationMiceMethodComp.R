### Look at the variation between different imputations for different methods in the mice package

library(ggplot2)
load("~/data/imputation/miceImpList6zeroColumns.Rdata")
load("~/data/imputation/evaluationDatasetBoxCox20161108.Rfile")
load("~/data/imputation/evaluationSpikeInBoxCox20161108.Rfile")

set.seed(23515)
rows<-sample(1:nrow(spikeInSetBoxCox), 10000)
smallEval<-evalSetBoxCox[rows,]
smallSpikeIn<-spikeInSetBoxCox[rows,]

# variabilityTable<-data.frame(matrix( nrow = 0, ncol = 6))
# colnames(variabilityTable)<-c("method","variable","m.iter","RMSEobs","RMSEimp")

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

colnames(variabilityTable)<-c("method", "variable", "m.iter", "RMSEobs", "RMSEimp")
variabilityTable$method<-factor(variabilityTable$method, levels = c( "mean", "norm.predict", "sample", "rf", "ri", "norm", "norm.boot", "norm.nob",  "pmm"))
variabilityTable<-variabilityTable[order(variabilityTable$method), ]

r2v<-vector()
x<-vector()
y<-vector()
for(i in levels(variabilityTable$method)){
  data.sub<-subset(variabilityTable, method==i)
  params<-summary(lm(RMSEobs ~ RMSEimp, data.sub))
  r2<-params$r.squared
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


### get "gd" data frame from the fancyImpute data in variationFancyImputeAnalysis.R
gd<-data.frame(method=gd$method, variable=gd$variable, m.iter=rep(1, nrow(gd)), RMSEobs=gd$x, RMSEimp=gd$y)
gd<-gd[order(gd$method),]

r2v<-vector()
x<-vector()
y<-vector()
for(i in levels(gd$method)){
  data.sub<-subset(gd, method==i)
  params<-summary(lm(RMSEobs ~ RMSEimp, data.sub))
  r2<-params$r.squared
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
methodsComp<-c("sample", "mean", "simple_median.csv", "knn_751.csv", "svd_2.csv", "si_s_8.csv", "mice_col_lambda_reg_1.csv", "mice_pmm_lambda_reg_001.csv", "norm.predict", "rf", "pmm", "norm")
sub.results<-subset(all.results, method %in% methodsComp)

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

png("~/plots/imputation/figuresForPaper/figure5_temp2.png", res = 300, width = 12, height = 7, units = "in")
p1+geom_text(aes(x=sub.results$x,y=sub.results$y, label=paste(expression(R^2), " = ", sub.results$r2)), inherit.aes = FALSE, show.legend = FALSE)
dev.off()

png("~/plots/imputation/fancyImputeErrorVsVariability.png", res = 300, width = 16, height = 9, units = "in")
ggplot(gd, aes( x=x, y=y, color=variable))+
  geom_point()+
  xlim(0, 2)+
  ylim(0, 2)+
  facet_wrap(~method)+
  geom_abline(slope = 1, intercept = 0)+
  xlab("RMSE Observed Vs. Imputed1")+
  ylab("RMSE Imputed1 Vs. Imputed2")+

  theme_bw()
dev.off()

labels.data<-data.frame(x = rep(1.4,1260), y=rep(1.1,1260), method= levels(variabilityTable$method), labs=LETTERS[1:9])

png("~/plots/imputation/miceRerrorVsVariabilityColMat6zerosGlobalScales.png", res = 300, width = 8, height = 4.5, units = "in")
p2<-ggplot(subset(variabilityTable, method!="quadratic"), aes(x=RMSEobs, y=RMSEimp, col=variable))+
  geom_point()+
  facet_wrap( ~ method, ncol = 3, scales = "free")+
  xlab("RMSE vs observed")+
  ylab("RMSE vs imputed")+
  #xlim(0, max(c(variabilityTable$RMSEobs, variabilityTable$RMSEimp)))+
  #ylim(0, max(c(variabilityTable$RMSEobs, variabilityTable$RMSEimp)))+
  geom_abline(slope = 1, intercept = 0)+
  scale_color_discrete("LOINC Code")+
  #ggtitle("Error Vs. Variability")+
  theme_bw()
dev.off()






p2+geom_text(aes(x=variabilityTable$x,y=variabilityTable$y, label=paste(expression(R^2), " = ", variabilityTable$r2)), inherit.aes = FALSE, show.legend = FALSE)
p2+geom_text(aes(x=variabilityTable$x,y=variabilityTable$y, label=bquote(R^2 ~ "=" ~.(variabilityTable$r2))), inherit.aes = FALSE, show.legend = FALSE)

vals<-variabilityTable$r2
bquote(R^2 ~ "=" ~.(vals))

Sys.time()-tic
file_name <- paste('../output/R', args[1], sep='_')
print(file_name)
eval.df <- data.frame(matrix(unlist(eval_list)))
rownames(eval.df) <- impMethod
write.csv(eval.df, file=file_name)



