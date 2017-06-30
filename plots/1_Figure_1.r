### Look at missingness for each lab and how it varies by age, sex, and BMI 
### Load the date and age trimmed median lab values with demographic informaiton
library(reshape2)
library(ggplot2)
library(gplots) 
library(RColorBrewer)
library(gridExtra)

setwd("~/code/imputation/plots/")
print(getwd())

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

summaryMissing<-cbind.data.frame(completeCasesCounts$lab, 
                                 completeCasesCounts$count/nrow(ptTrimMedResDemWide), 
                                 missing.percent)
colnames(summaryMissing)<-c("Rank", "Complete Cases", "Missing Values")
#rownames(summaryMissing)<-NULL

### Set colors for all panels
#colPalette<-brewer.pal(3, "Accent")

### Make a plot with the percent missing data for each lab and the number of complete cases at each cutoff
p1<-ggplot(melt(summaryMissing[5:75,], id.vars = "Rank"), aes(x=Rank-4, y=value*100, color=variable))+
  geom_point(size=3)+
  geom_vline(xintercept=28.5)+
  #scale_color_manual("", values=colPalette)+
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
  #scale_fill_manual("", values=colPalette)+
  theme_bw()+
  theme(legend.justification=c(1,1), 
        legend.position=c(1,1),
        axis.text.x=element_text(colour="black", size = 16),
        axis.text.y=element_text(colour="black", size = 16),
        text=element_text(size = 16))


### Make plot showing the number of missing labs per patient by age and BMI
colPalette<-brewer.pal(3, "Set1")
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

# all labs
all_lab_names <- c("10330-9", "10334-1", "10466-1", "10501-5", "10535-3", "10886-0", "11572-5",
                   "11580-8", "12180-6", "12187-1", "12841-3", "13457-7", "13964-2", "13965-9", "13967-5",
                   "13969-1", "13982-4", "14338-8", "14804-9", "14957-5", "14959-1", "1743-4", "1763-2", "17820-2",
                   "17849-1", "17856-6", "17861-6", "17862-4", "1798-8", "1825-9", "18262-6", "1834-1", "19123-9",
                   "1922-4", "1925-7", "1960-4", "1968-7", "1975-2", "1986-9", "1988-5", "1989-3", "1990-1",
                   "19994-3", "2019-8", "2028-9", "2039-6", "20433-9", "20436-2", "20437-0", "20438-8", "20448-7",
                   "20563-3", "20565-8", "2064-4", "2069-3", "2075-0", "2085-9", "2093-3", "21198-7", "2132-9",
                   "2143-6", "2157-6", "2160-0", "2236-8", "2243-4", "2276-4", "2284-8", "2324-2", "2339-0",
                   "2340-8", "2345-7", "23860-0", "2458-8", "2465-3", "2472-9", "2498-4", "2501-5", "2502-3",
                   "2571-8", "2614-6", "26498-6", "2703-7", "2708-6", "2714-4", "2731-8", "27353-2", "2742-5",
                   "2744-1", "2777-1", "27811-9", "27818-4", "27822-6", "28009-9", "2823-3", "2839-9", "2857-1",
                   "2885-2", "2888-6", "2889-4","2951-2", "2965-2", "2986-8", "2990-0", "2991-8", "29958-6",
                   "30239-8", "3024-7", "3026-2", "3040-3", "3051-0", "30522-7", "3084-1", "30934-4", "3094-0",
                   "3167-4", "3181-5", "3182-3", "3255-7", "32623-1", "33762-6", "38483-4", "4544-3", "5206-8",
                   "53115-2", "6303-2", "6690-2", "71695-1", "718-7", "72582-0", "72586-1", "72598-6", "739-3",
                   "740-1", "748-4", "751-8", "763-3", "764-1", "777-3", "785-6", "786-4", "787-2", "788-0", "789-8")
scores<-read.csv("~/data/imputation/prediction_scores/real_all_labs.csv")
print(dim(scores))
drops <- "X"
scores = scores[ , !(colnames(scores) %in% drops)]
colnames(scores) <- all_lab_names
scores_df <- melt(scores)

colnames(scores_df) <- c("Labs", "ROC_AUC")
p7 = ggplot(scores_df, aes(x=reorder(Labs, -ROC_AUC), y=ROC_AUC, color=Labs)) +
  ggtitle("G.") +
  labs(y="ROC AUC", x="Labs") +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) + 
  theme(legend.position="none",
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_text(colour="black", size = 16),
        text=element_text(size = 16)) + 
  scale_y_continuous(limits = c(0.5, 1))

# top 29
loinc <- c("718-7", "4544-3", "787-2", "786-4", "785-6", "6690-2", "789-8", "788-0", "32623-1", "777-3",
           "2345-7", "2160-0", "2823-3", "3094-0", "2951-2", "2075-0", "2028-9", "17861-6", "1743-4",
           "30239-8", "1975-2", "2885-2", "10466-1", "751-8", "2093-3", "2571-8", "2085-9", "13457-7",
           "2965-2")
select_scores<-scores[, loinc]
print(dim(select_scores))

colnames(select_scores) = loinc
select_scores <- select_scores[, !(names(select_scores) %in% "X")]
select_scores_df <- melt(select_scores)
colnames(select_scores_df) <- c("Lab", "ROC_AUC")

p8 = ggplot(select_scores_df, aes(x=reorder(Lab, -ROC_AUC), y=ROC_AUC, color=Lab)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) + 
  ggtitle("H.") +
  labs(y="ROC AUC", x="Labs") +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1),
        text=element_text(size = 16)) + 
  scale_y_continuous(limits = c(0.5, 1))

### Print four panels into one png
png("../figures/figure_1.png", width = 12, height=12, res = 300, units = "in")
grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, ncol = 2)
dev.off()


### make heatmap of correlations in labs data
load("~/data/imputation/trimmedMedianTop28LabResultsPlusDemographics.Rfile")
cormat<-cor(ptTop28TrimMedResDemWide[,-c(1,2)], use = "pair")
colorRampPalette(c("white","aliceblue","blue","darkblue","black"))

png("../figures/Supplemental_Figure_20.png", width = 24, height=16, units = "in", res = 300)
heatmap.2(abs(cormat), trace = "none", key.title = "Absolute Correlation", tracecol = "black" ,adjCol = c(1,.65))
dev.off()
