### Look at missingness for each lab and how it varies by age, sex, and BMI 
### Load the date and age trimmed median lab values with demographic informaiton
library(reshape2)
library(ggplot2)
library(RColorBrewer)
library(gridExtra)
load("~/data/imputation/trimmedMedianLabResultsPlusDemographics.Rfile")

### Throw out those patients without BMI info
ptTrimMedResDemWide<-ptTrimMedResDemWide[-which(is.na(ptTrimMedResDemWide$BMI)),]

### Make data frame with the percent missing data for each lab
missing.percent<-apply(ptTrimMedResDemWide, 2, function(x) length(which(is.na(x)))/length(x))

missingness<-data.frame(lab=1:(length(missing.percent)-4),
                        percentMissing=missing.percent[-c(1:4)][order(missing.percent[-c(1:4)])]  )

### Get number of complete cases for each lab (including all labs that are more common)
completeCasesCounts<-data.frame()
for(i in 1:ncol(ptTrimMedResDemWide)){
  completeCasesCounts[i,1]<-i
  completeCasesCounts[i,2]<-length(which(complete.cases(ptTrimMedResDemWide[,1:i])))
}
colnames(completeCasesCounts)<-c("lab", "count")

summaryMissing<-cbind.data.frame(completeCasesCounts$lab, completeCasesCounts$count/nrow(ptTrimMedResDemWide), missing.percent)
colnames(summaryMissing)<-c("Rank", "Complete Cases", "Missing Values")
#rownames(summaryMissing)<-NULL

### Set colors for all panels
colPalette<-brewer.pal(3, "Set1")

### Make a plot with the percent missing data for each lab and the number of complete cases at each cutoff
p1<-ggplot(melt(summaryMissing[1:75,],  id.vars = "Rank"), aes(x=Rank, y=value*100, color=variable))+
  geom_point(size=3)+
  geom_vline(xintercept=32.5)+
  scale_color_manual("", values=colPalette)+
  ylab("Percent")+
  ggtitle("A.")+
  theme_bw()+
  theme(legend.justification=c(1,.85), 
    legend.position=c(1,.85),
    axis.text.x=element_text(colour="black", size = 16),
    axis.text.y=element_text(colour="black", size = 16),
    text=element_text(size = 16))


### Make a histogram showing the distribution of ages colored by complete cases for the top 28 labs 
top28<-ptTrimMedResDemWide[,1:32]
is.incomplete<-function(x){
  if(sum(is.na(x))>0){
    return("All Patients")
  }else{
    return("Complete Cases")
  }
}
incomplete.patients<-apply(top28, 1, is.incomplete)
incomplete.patients<-factor(incomplete.patients, levels = c("Complete Cases", "All Patients"))
top28<-cbind.data.frame(top28, incomplete.patients)

p2<-ggplot(top28, aes(x=medAge, fill=incomplete.patients))+
  geom_histogram(binwidth = 1, color="black", size=.1)+
  xlab("Patient Age")+
  ylab("Patient Count")+
  ggtitle("B.")+
  scale_fill_manual("", values=colPalette)+
  theme_bw()+
  theme(legend.justification=c(1,1), 
        legend.position=c(1,1),
        axis.text.x=element_text(colour="black", size = 16),
        axis.text.y=element_text(colour="black", size = 16),
        text=element_text(size = 16))
  
  
### Make plot showing the number of missing labs per patient by age and BMI

missing.count<-apply(top28, 1, function(x){length(which(is.na(x)))})
top28<-cbind.data.frame(top28, missing.count)

ggplot(top28, aes(x=missing.count))+
  geom_histogram()+
  xlab("Number of Missing Labs")+
  ylab("Number of Patients")+
  theme_bw()


p3<-ggplot(subset(top28, SEX %in% c("Male", "Female")), aes(x=medAge, y=missing.count, color=SEX, fill=SEX))+
#  geom_hex()+
  xlab("Patient Age")+
  ylab("Number of Missing Labs")+
  ggtitle("C.")+
  geom_smooth()+
  scale_color_manual("", values=colPalette)+
  scale_fill_manual("", values=colPalette)+
  theme_bw()+
  theme(legend.justification=c(1,1), 
        legend.position=c(1,1),
        axis.text.x=element_text(colour="black", size = 16),
        axis.text.y=element_text(colour="black", size = 16),
        text=element_text(size = 16))


p4<-ggplot(subset(top28, SEX %in% c("Male", "Female")), aes(x=BMI, y=missing.count, color=SEX, fill=SEX))+
  #  geom_hex()+
  xlab("Patient BMI")+
  ylab("Number of Missing Labs")+
  ggtitle("D.")+
  geom_smooth()+
  scale_color_manual("", values=colPalette)+
  scale_fill_manual("", values=colPalette)+
  xlim(15,65)+
  theme_bw()+
  theme(legend.justification=c(1,1), 
        legend.position=c(1,1),
        axis.text.x=element_text(colour="black", size = 16),
        axis.text.y=element_text(colour="black", size = 16),
        text=element_text(size = 16))

missing.lipids<-apply(top28[,29:32], 1, function(x){length(which(is.na(x)))})
top28<-cbind.data.frame(top28, missing.lipids)

p5<-ggplot(subset(top28, SEX %in% c("Male", "Female")), aes(x=medAge, y=missing.lipids, color=SEX, fill=SEX))+
  #  geom_hex()+
  xlab("Patient Age")+
  ylab("Missing Lipid Results")+
  ggtitle("E.")+
  geom_smooth()+
  scale_color_manual("", values=colPalette)+
  scale_fill_manual("", values=colPalette)+
  theme_bw()+
  theme(legend.justification=c(1,1), 
        legend.position=c(1,1),
        axis.text.x=element_text(colour="black", size = 16),
        axis.text.y=element_text(colour="black", size = 16),
        text=element_text(size = 16))

p6<-ggplot(subset(top28, SEX %in% c("Male", "Female")), aes(x=BMI, y=missing.lipids, color=SEX, fill=SEX))+
  #  geom_hex()+
  xlab("Patient BMI")+
  ylab("Missing Lipid Results")+
  ggtitle("F.")+
  geom_smooth()+
  scale_color_manual("", values=colPalette)+
  scale_fill_manual("", values=colPalette)+
  xlim(15,65)+
  theme_bw()+
  theme(legend.justification=c(1,1), 
        legend.position=c(1,1),
        axis.text.x=element_text(colour="black", size = 16),
        axis.text.y=element_text(colour="black", size = 16),
        text=element_text(size = 16))

### Print four panels into one png
png("~/plots/imputation/figuresForPaper/figure1.png", width = 16, height=9, res = 300, units = "in")
grid.arrange(p1, p2, p3, p4, p5, p6, ncol = 2)
dev.off()






### make heatmap of correlations in labs data
cormat<-cor(ptTop28TrimMedResDemWide[,-c(1,2)], use = "pair")

heatmap.2(abs(cormat), trace = "none", key.title = "Absolute Correlation", tracecol = "black" ,adjCol = c(1,.65))

colorRampPalette(c("white","aliceblue","blue","darkblue","black"))

png("~/plots/labwas/multivar/clustICD9byLabsLDA.all.scalings.wide.png", width = 24, height=16, units = "in", res = 300)
heatmap.2(abs(all.scaling.mat), trace = "none", key.title = "Scaling", labCol = F, dendrogram = "row", col = bwPalette, , Colv = F)
dev.off()




