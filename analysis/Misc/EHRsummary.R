library(magrittr)
library(dplyr)
library(ggplot2)
load("~/data/LABWAS/all.labs.dates.long.R")
all.labs.dates.long$ptid<-factor(all.labs.dates.long$ptid)
load("~/data/imputation/Demographics_AllEHR_20160429.Rfile")
colnames(demographicsAllEHR)<-c("ptid","MYCODE","DOB","DOD","LIVING","SEX","RACE","HISPANIC","BMI")

### Get the median date of all labs for each patient and calculate median age.
ptMedianDates<-all.labs.dates.long %>%
  group_by(ptid) %>%
  summarize(medDate=median(dateTime))

ptMedianAges<-merge(ptMedianDates, demographicsAllEHR[,c("ptid", "DOB")])
ptMedianAges$DOB<-as.Date(ptMedianAges$DOB)
ptMedianAges$medAge<-ptMedianAges$medDate - ptMedianAges$DOB 
minorIDs<-ptMedianAges$ptid[which(ptMedianAges$medAge < (365*18))]
#save(minorIDs, file = "~/data/imputation/minorIDs.Rfile")
rm(ptMedianDates)

adults<-ptMedianAges[(!ptMedianAges$ptid %in% minorIDs),]

pdf("~/plots/imputation/medianAges.pdf", width = 8, height=5) 
ggplot(subset(ptMedianAges, medAge>0), aes(x=medAge/365))+
  geom_histogram(binwidth = 1)+
  ggtitle("Patient Median Ages")+
  xlab("Age in Years (1 Year Bins)")+
  theme_bw()
dev.off()

png("~/plots/imputation/EHRsummary/ageDistributionForImputationProject.png", width = 8, height=5, res = 300, units = "in") 
ggplot(subset(ptMedianAges, medAge>(365*18)), aes(x=medAge/365))+
  geom_histogram(binwidth = 1)+
  ggtitle("Patient Median Ages")+
  xlab("Age in Years (1 Year Bins)")+
  theme_bw()
dev.off()



### Plot the entire distribution of ages for all labs 
ptDOB<-inner_join(all.labs.dates.long, demographicsAllEHR[,c("ptid", "DOB", "DOD")])
ptDOB$DOB<-as.Date(ptDOB$DOB)
ptDOB$age<-ptDOB$dateTime - ptDOB$DOB 

rm(all.labs.dates.long)

pdf("~/plots/imputation/allLabAges.pdf", width = 8, height=5) 
ggplot(subset(ptDOB, age>0), aes(x=age/365))+
  geom_histogram(binwidth = 1)+
  ggtitle("Ages for All Labs")+
  xlab("Age in Years (1 Year Bins)")+
  theme_bw()
dev.off()

png("~/plots/imputation/EHRsummary/ageDistributionForAllLabs.png", width = 8, height=5, res = 300, units = "in") 
ggplot(subset(ptDOB, age>(365*18)), aes(x=age/365))+
  geom_histogram(binwidth = 1)+
  ggtitle("Patient Ages at Date of Lab")+
  xlab("Age in Years (1 Year Bins)")+
  theme_bw()
dev.off()

### Zoom in to see the peak for infants

pdf("~/plots/imputation/allPediatricLabAges.pdf", width = 8, height=5) 
ggplot(subset(ptDOB, age>(0*365) & age<(4*365)), aes(x=age/365))+
  geom_histogram(binwidth = 1/365)+
  ggtitle("Ages for All Pediatric Labs")+
  xlab("Age in Years (1 Day Bins)")+
  scale_y_sqrt()+
  theme_bw()
dev.off()



