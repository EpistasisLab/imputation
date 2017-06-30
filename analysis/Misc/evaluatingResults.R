# read in Brett's imputed data.
library(reshape2)

missingSpike<-read.csv("~/Dropbox/Imputation/testDataTop28/completeCasesSpikeInBoxCox.csv", check.names = F)[1:10000,]
missingSpike$ptid<-factor(missingSpike$ptid)
missingSpike<-cbind.data.frame(missingSpike, method=rep("spikeIn", nrow(missingSpike)))
files<-dir("~/Downloads/10k")[-1]

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


#### Color points by missingness of predictor variables
### First add a column to designates presence or absence of each variable
data.wide<-subset(data.long, method="MICE")

i<-24
j<-20
na.2028<-subset(data.wide, variable == "2028-9")$imputed

data.wide$na.2028<-rep(na.2028, 31)

  png(paste("~/plots/imputation/evalution/fancyImpute/", levels(data.long$variable)[i], "colBy", levels(data.long$variable)[j], ".png", sep=""), width = 12, height = 14, res = 300, units = "in")
  ggplot(subset(data.wide, variable==paste(levels(data.long$variable)[i]) & imputed), aes(x=original, y=value, col=factor(na.2028)))+
          geom_point(alpha=.1)+
          #geom_smooth(method = "lm")+
          facet_wrap(~method, ncol = 4)+
          xlim(c(-3,3))+
          ylim(c(-3,3))+
          ggtitle(paste(levels(data.long$variable)[i]))+
          theme_bw()
  dev.off()
  
  










