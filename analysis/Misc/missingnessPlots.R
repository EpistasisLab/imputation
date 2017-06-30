### Look at missingness for each lab and how it varies by age, sex, and BMI 
### Load the date and age trimmed median lab values with demographic informaiton
load("~/data/imputation/trimmedMedianLabResultsPlusDemographics.Rfile")

### Throw out those patients without BMI info
ptTrimMedResDemWide<-ptTrimMedResDemWide[-which(is.na(ptTrimMedResDemWide$BMI)),]

### Make data frame with the percent missing data for each lab
missing.percent<-apply(ptTrimMedResDemWide, 2, function(x) length(which(is.na(x)))/length(x))

missingness<-data.frame(lab=1:(length(missing.percent)-4),
                        percentMissing=missing.percent[-c(1:4)][order(missing.percent[-c(1:4)])]  )

png("~/plots/imputation/EHRsummary/missingnessByLab.png", width = 8, height=5, res = 300, units = "in") 
ggplot(missingness, aes(x=lab, y=percentMissing))+
  geom_point(size=5, color=alpha("black", .5))+
  xlab("Labs ranked by percent missing data")+
  ylab("Percent Missing")+
  theme_bw()
dev.off()


### Make a plot with the number of complete cases as the number of included labs increases
completeCasesCounts<-data.frame()
for(i in 1:ncol(ptTrimMedResDemWide)){
  completeCasesCounts[i,1]<-i
  completeCasesCounts[i,2]<-length(which(complete.cases(ptTrimMedResDemWide[,1:i])))
}
colnames(completeCasesCounts)<-c("lab", "count")

png("~/plots/imputation/EHRsummary/completeCasesByLab.png", width = 8, height=5, res = 300, units = "in") 
ggplot(completeCasesCounts, aes(x=lab, y=count))+
  geom_point(size=5, color=alpha("black", .5))+
  xlab("Labs ranked by percent missing data")+
  ylab("Number of Complete Cases")+
  annotate("rect", xmin=-1.1, xmax=34.1, ymin=175000, ymax=615000, alpha=0.1, color="red")+
  theme_bw()
dev.off()


 top28<-ptTrimMedResDemWide[,1:32]
 complete.patients<-top28[which(complete.cases(top28)),]
 missing.any<-top28[-which(complete.cases(top28)),]

missing.count<-apply(top28, 1, function(x){length(which(is.na(x)))})
top28<-cbind(top28, missing.count)

png("~/plots/imputation/EHRsummary/numberMissingLabsPerPatient.png", width = 8, height=5, res = 300, units = "in")
ggplot(top28, aes(x=missing.count))+
  geom_histogram()+
  xlab("Number of Missing Labs")+
  ylab("Number of Patients")+
  theme_bw()
dev.off()

png("~/plots/imputation/EHRsummary/numberMissingLabsByAge.png", width = 8, height=5, res = 300, units = "in")
ggplot(subset(top28, SEX %in% c("Male", "Female")), aes(x=medAge, y=missing.count, color=SEX, fill=SEX))+
#  geom_hex()+
  xlab("Patient Median Age")+
  ylab("Average Number of Missing Labs")+
  geom_smooth()+
  theme_bw()
dev.off()

png("~/plots/imputation/EHRsummary/numberMissingLabsByBMI.png", width = 8, height=5, res = 300, units = "in")
ggplot(subset(top28, SEX %in% c("Male", "Female")), aes(x=BMI, y=missing.count, color=SEX, fill=SEX))+
  #  geom_hex()+
  xlab("Patient Mean BMI")+
  ylab("Average Number of Missing Labs")+
  geom_smooth()+
  xlim(0,75)+
  theme_bw()
dev.off()

