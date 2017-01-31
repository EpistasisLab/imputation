### Imputation of top 28 clinical labs to test utility for GWAS
### Based on preliminary estimates of the error for each method, MICE::col/norm.pred and soft impute seem to work well.
### We will use them to impute all missing values given all observed values in our data set and then compare the GWAS results.

### Load in the required data and packages
library(data.table)
library(lattice)
library(mice)
library(corrplot)
library(gplots)
library(mice)
source("~/Dropbox/BTI/scripts/labwas/LabWAS.Analysis1.functions.R")
load("~/data/LABWAS/all.labs.long.R")
load("~/data/LABWAS/loincToEnglish.R")
load("~/data/LABWAS/Demographics_AllEHR_20160429.Rfile")
load("~/data/LABWAS/giaEurUR.R")

### Get median values and remove the one extreme outlier patient
wide.data<-dcast(all.labs.long, ptid~valset, fun.aggregate = median, value.var="labres")
wide.data<-data.table(wide.data)
setkey(wide.data, ptid)
wide.data["PT259410",names(wide.data) := NA]

### Get rid of potential numerical problems
low.freq.0<-0
high.freq.0<-0
replace.NaN(wide.data)
replace.Infinite(wide.data)
replace.zero(wide.data)

### Transform data
bc.sub<-boxcox(wide.data)
bc.sub<-scale(bc.sub)
bc.sub<-cbind.data.frame(ptid=wide.data$ptid, bc.sub)
bc.sub$ptid<-as.character(bc.sub$ptid)

### Get rid of unnecessary data
rm(all.labs.long)
rm(wide.data)
gc()

### Impute using MICE::norm.pred with lambda = 0.2
miss.frac<-apply(bc.sub, 2, function(x) length(which(is.na(x)))/length(x))
cols<-which(miss.frac<.9)

#rows<-sample(1:nrow(bc.sub), 10000)
#test.set<-bc.sub[rows,cols]
#test.set$ptid<-as.character(test.set$ptid)

imp.set<-bc.sub[,cols]

tic<-Sys.time()
imp <- mice(imp.set, visitSequence = "monotone", m=3, method = "norm.predict", ridge=0.2, maxit = 75)
Sys.time()-tic

#allEHR_46labs_miceNormPredict_ridge0.2<-imp
#save(allEHR_46labs_miceNormPredict_ridge0.2, file = "~/data/imputation/GWAStest/allEHR_46labs_miceNormPredict_ridge0.2_mids.Rfile")
#mice.convergence.plot(data=allEHR_46labs_miceNormPredict_ridge0.2, outfile="~/plots/imputation/GWAStest/miceConvergence_46labs_normPredict_ridge0.2.pdf")

### Take mids object and extract 3 datasets:
### 1 - All traits for all MyCode patients (observed + imputed)
### 2 - All observed traits only
### 3 - All imputed traits only

observedOnly<-imp$data
observedPlusImputed<-imp$data

for(i in 2:length(allEHR_46labs_miceNormPredict_ridge0.2$imp)){
  NAi<-which(is.na(observedOnly[,i]))
  observedPlusImputed[NAi,i]<-imp$imp[[i]][,3]
}

imputedOnly<-observedPlusImputed
imputedOnly[!is.na(observedOnly)]<-NA
imputedOnly$ptid<-observedPlusImputed$ptid

save(observedPlusImputed, file = "~/data/imputation/GWAStest/allEHR_46labs_miceNormPredict_ridge0.2_observedPlusImputed.Rfile")
save(observedOnly, file = "~/data/imputation/GWAStest/allEHR_46labs_miceNormPredict_ridge0.2_observedOnly.Rfile")
save(imputedOnly, file = "~/data/imputation/GWAStest/allEHR_46labs_miceNormPredict_ridge0.2_imputedOnly.Rfile")

giaEurUR$ptid<-data.frame(matrix(unlist(strsplit(giaEurUR[,1], split = "_")), ncol = 3, byrow = T))[,2]
colnames(giaEurUR)[1]<-"ghsid"

phen.observed<-merge(giaEurUR, observedOnly)
phen.imputed<-merge(giaEurUR, imputedOnly)
phen.observedPlusImputed<-merge(giaEurUR, observedPlusImputed)

phen.observed$ptid<-phen.observed$ghsid
phen.imputed$ptid<-phen.imputed$ghsid
phen.observedPlusImputed$ptid<-phen.observedPlusImputed$ghsid

colnames(phen.observed)[1:2]<-c("fid", "iid")
colnames(phen.imputed)[1:2]<-c("fid", "iid")
colnames(phen.observedPlusImputed)[1:2]<-c("fid", "iid")

write.table(phen.observed, file = "~/data/imputation/GWAStest/phen.observed.txt", row.names = F, sep = "\t", quote = F)
write.table(phen.observedPlusImputed, file = "~/data/imputation/GWAStest/phen.observedPlusImputed.txt", row.names = F, sep = "\t", quote = F)
write.table(phen.imputed, file = "~/data/imputation/GWAStest/phen.imputed.txt", row.names = F, sep = "\t", quote = F)

#split.phen.observed.1<-phen.observed[,1:25]
#split.phen.observed.2<-phen.observed[,c(1,2,26:47)]



