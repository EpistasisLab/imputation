library(data.table)
library(psych)
library(ggplot2)
library(reshape2)
library(plyr)
library(car)
library(gridExtra)
load("~/data/LABWAS/all.labs.long.R")
load("~/data/LABWAS/loincToEnglish.R")

labs.per.patient<-dcast(all.labs.long, ptid~valset, fun.aggregate = length, value.var="labres")

replace.zero.counts = function(data=labs.per.patient){
  for (i in names(data)){
    data[get(i)==0,i:=NA,with=FALSE]
  }
}
replace.zero.counts(labs.per.patient)

labs.per.patient.pearson.corr<-cor(labs.per.patient[,!"ptid", with=F], use="pairwise.complete.obs", method = "pearson")
labs.per.patient.spearman.rho<-cor(labs.per.patient[,!"ptid", with=F], use="pairwise.complete.obs", method = "spearman")

ord.labs.per.patient.pearson<-hclust(dist(labs.per.patient.pearson.corr, method = "euclidean"), method = "ward.D" )$order
ord.labs.per.patient.spearman<-hclust(dist(labs.per.patient.spearman.rho, method = "euclidean"), method = "ward.D" )$order
clust.labs.per.patient.pearson<-labs.per.patient.pearson.corr[ord.labs.per.patient.pearson,ord.labs.per.patient.pearson]
clust.labs.per.patient.spearman<-labs.per.patient.spearman.rho[ord.labs.per.patient.spearman,ord.labs.per.patient.spearman]

melted.labs.per.patient.counts<-melt(count.labs.per.patient.pairs, value.name = "count")
melted.labs.per.patient.pearson<-melt(clust.labs.per.patient.pearson, value.name = "correlation")
melted.labs.per.patient.spearman<-melt(clust.labs.per.patient.spearman, value.name = "correlation")

count.cors.labs.per.patient<-merge(melted.labs.per.patient.pearson, melted.labs.per.patient.counts, sort=F)
count.cors.labs.per.patient.spearman<-merge(melted.labs.per.patient.spearman, melted.labs.per.patient.counts, sort=F)

name.count.cors.labs.per.patient<-count.cors.labs.per.patient
name.count.cors.labs.per.patient$Var2<-mapvalues(count.cors.labs.per.patient$Var2, from=loincToEnglish$code, to=as.character(loincToEnglish$abbrevs))
name.count.cors.labs.per.patient$Var1<-mapvalues(count.cors.labs.per.patient$Var1, from=loincToEnglish$code, to=as.character(loincToEnglish$abbrevs))

hist(name.count.cors.labs.per.patient$correlation,breaks = 1000)

cors.plot.cont<-ggplot(name.count.cors.labs.per.patient, aes(x=Var1, y=Var2, fill = correlation)) +
  geom_raster()+
  xlab("")+ylab("")+
  scale_fill_gradient2(low="blue", high="red")+
  theme_bw()+
  ggtitle("Patient Counts Per Lab Pearson Correlation")+
  theme(axis.text.x = element_text(angle = 60, vjust = 1, hjust=1))+
  theme(axis.text.y = element_text(size=6))+
  scale_y_discrete(breaks=c("CrMviB", "CrtnMviSoP", "UnMviSoP", "FrMviSoP", "dRLs", "HMviSoP", "UMviSoP", "NpBMviSoP", "NpBpNTMviSoP", "PiMviSoP", "PMti2hU", "PMviU", "MMviU", "MCMRiU", "GMviSoP", "HAHtiBbH", "GmvMviBEfgh", "GMviB", "GMviBbAts", "OsiAb", "OPpiAb", "FoiAb", "CkEaviSoP", "CkMMviSoP", "OIgsVFV", "IgviBbAc", "LviBbAc", "NviBbAc", "M1liB", "M1liBbMc", "MtviBbMc", "MyviBbMc", "NbfviBbMc", "Nbf1liBbMc", "GMviSoP3hpdg", "GMviSoP2hpdg", "GMviSoP1hpdg", "CpMviSoP", "IUviSoP", "TrMviSoP", "BgPtiSoPbE", "BgPtPmfiSoPbE", "FMviPppbCa", "PviBbAc", "A1aMviSoP", "CrlMviSoP", "EdwRbAc", "CrpMviSoP", "CrpMviSoPbHsm", "Ig1liBbAc", "CAMviSoP", "DMviSoP", "MtMviSoP", "CkMCktiSoPbE", "CrtsMviSoP", "CA1UviSoP", "LdEaviSoPbLtpr", "R1eiBbAc", "PSAFPsAtiSoP", "PSAFMviSoP", "PsAMviSoP", "BdiAb", "Ag3iSoP", "PhMviSoP", "PtMviSoP", "BeiAbbc", "CdPpiAb", "CdtMviSoP", "BMviAb", "CdtMviB", "IAMviSoP", "IGMviSoP", "GgPtPmfiSoPbE", "poAb", "PrtMviSoP", "VloU", "Vo2hU", "CIGAUviSbI", "CIMAUviSbI", "RenIAUviSbI", "IMMviSoP", "AceEaviSoP", "AEaviSoP", "LEaviSoP", "CVBMviSoP", "FlMviSoP", "Hsv1IAUviSbI", "PmvEviBbAc", "CVD2MviSoP", "RfUviSoP", "TUviSoPbDl00mL", "SgoU", "M1liBfbMc", "EviBfbAc", "LUviSoP", "FUviSoPb2I", "ClcdMviSoP", "CVD3MviSoP", "ShbgMviSoP", "CiHMviSoP", "ChMviB", "ChlrMviSoP", "PrgMviSoP", "CbsUviSoP", "EEMviSoP", "PSaniPppbCa", "AaniPppbCm", "PCaniPppbCm", "SMviSoP", "APtiBfbE", "MgMviSoP", "TTfMviSoP", "TTMviSoP", "AMviSoP", "MHtiB", "CMviU", "CHtiB", "EviBbAc", "HVFoBbAc", "HMviB", "ChlsMviSoP", "CiLMviSoPbc", "CiLMviSoPbDa", "PrlMviSoP", "APtPmfiSoPbE", "IbcuMviSoP", "TTFMviSoP", "CiMviSoPbIsmeI", "ClcmMviSoP", "TFMviSoP", "TsMviSoP", "TfwbMviSoP", "AlaEaviSoPbWP5P", "AsaEaviSoPbWP5P", "BdMviSoP", "BtMviSoP", "A1FMviSoP", "GgtEaviSoP", "EmchEmbAc", "EmcvEvbAc", "EmchcMvbAc", "IrMviSoP", "IsMFiSoP"),
                   labels=c("Creatinine ", "Creatinine ", "Urea nitrogen", "Ferritin ", "dRVVT ", "Homocysteine ", "Urate ", "Natriuretic peptide", "Natriuretic peptide", "Parathyrin", "Protein ", "Protein ", "Microalbumin ", "Microalbumin", "Glucose ", "Hemoglobin A1c", "Glucose mean", "Glucose ", "Glucose ", "Oxygen saturation", "Oxygen ", "Fractional oxyhemoglobin", "Creatine kinase", "Creatine kinase", "Oxygen", "Immature granulocytes", "Leukocytes ", "Neutrophils ", "Myelocytes", "Metamyelocytes", "Metamyelocytes ", "Myelocytes ", "Neutrophils", "Neutrophils", "Glucose ", "Glucose ", "Glucose ", "C peptide", "Insulin ", "Triglyceride ", "Beta globulin", "Beta globulin", "Fibrinogen ", "Platelets ", "Alpha 1", "Ceruloplasmin ", "Erythrocyte distribution", "C reactive", "C reactive", "Immature granulocytes", "Carcinoembryonic Ag", "Digoxin ", "Methylmalonate ", "Creatine kinase", "Cortisol ", "Cancer Ag", "Lactate dehydrogenase", "Reticulocytes", "Prostate Specific", "Prostate Specific", "Prostate specific", "Base deficit", "Anion gap", "Phosphate ", "Potassium ", "Base excess", "Carbon dioxide", "Carbon dioxide", "Bicarbonate ", "Carbon dioxide", "IgA ", "IgG ", "Gamma globulin", "pH of", "Protein ", "Volume of", "Volume of", "Cardiolipin IgG", "Cardiolipin IgM", "Ribonucleoprotein extractable", "IgM ", "Angiotensin converting", "Amylase ", "Lipase ", "Cobalamin ", "Folate ", "Herpes simplex", "Platelet mean", "Calciferol ", "Rheumatoid factor", "Thyrotropin ", "Specific gravity", "Monocytes", "Erythrocytes ", "Lutropin ", "Follitropin ", "Calcidiol ", "Cholecalciferol ", "Sex hormone", "Cholesterol in", "Chloride ", "Chloride ", "Progesterone ", "Choriogonadotropin", "Estradiol ", "Protein S", "Antithrombin actual", "Protein C", "Sodium ", "Albumin", "Magnesium ", "Thyroxine ", "Thyroxine ", "Aldosterone ", "Methemoglobin", "Calcium ", "Carboxyhemoglobin", "Erythrocytes ", "Hematocrit ", "Hemoglobin ", "Cholesterol ", "Cholesterol in", "Cholesterol in", "Prealbumin ", "Albumin", "Iron binding", "Triiodothyronine ", "Calcium", "Calcium ", "Testosterone Free", "Testosterone ", "Testosterone", "Alanine aminotransferase", "Aspartate aminotransferase", "Bilirubin", "Bilirubin", "Alpha", "Gamma glutamyl", "Erythrocyte mean", "Erythrocyte mean", "Erythrocyte mean", "Iron ", "Iron saturation")
  )
png("~/plots/imputation/labPanels/ptCountsPerLabCorrelationClustCont.png", width = 16, height=9, res = 300, units = "in")
cors.plot.cont
dev.off()


cors.plot.disc<-ggplot(name.count.cors.labs.per.patient, aes(x=Var1, y=Var2, fill = correlation)) +
  geom_raster()+
  xlab("")+ylab("")+
  #scale_fill_gradient2(low="blue", high="red")+
  scale_fill_gradientn(colours = c("red"), limits=c(.87,1))+
  theme_bw()+
  ggtitle("Patient Counts Per Lab Pearson Correlation")+
  theme(axis.text.x = element_text(angle = 60, vjust = 1, hjust=1))+
  theme(axis.text.y = element_text(size=6))+
  scale_y_discrete(breaks=c("CrMviB", "CrtnMviSoP", "UnMviSoP", "FrMviSoP", "dRLs", "HMviSoP", "UMviSoP", "NpBMviSoP", "NpBpNTMviSoP", "PiMviSoP", "PMti2hU", "PMviU", "MMviU", "MCMRiU", "GMviSoP", "HAHtiBbH", "GmvMviBEfgh", "GMviB", "GMviBbAts", "OsiAb", "OPpiAb", "FoiAb", "CkEaviSoP", "CkMMviSoP", "OIgsVFV", "IgviBbAc", "LviBbAc", "NviBbAc", "M1liB", "M1liBbMc", "MtviBbMc", "MyviBbMc", "NbfviBbMc", "Nbf1liBbMc", "GMviSoP3hpdg", "GMviSoP2hpdg", "GMviSoP1hpdg", "CpMviSoP", "IUviSoP", "TrMviSoP", "BgPtiSoPbE", "BgPtPmfiSoPbE", "FMviPppbCa", "PviBbAc", "A1aMviSoP", "CrlMviSoP", "EdwRbAc", "CrpMviSoP", "CrpMviSoPbHsm", "Ig1liBbAc", "CAMviSoP", "DMviSoP", "MtMviSoP", "CkMCktiSoPbE", "CrtsMviSoP", "CA1UviSoP", "LdEaviSoPbLtpr", "R1eiBbAc", "PSAFPsAtiSoP", "PSAFMviSoP", "PsAMviSoP", "BdiAb", "Ag3iSoP", "PhMviSoP", "PtMviSoP", "BeiAbbc", "CdPpiAb", "CdtMviSoP", "BMviAb", "CdtMviB", "IAMviSoP", "IGMviSoP", "GgPtPmfiSoPbE", "poAb", "PrtMviSoP", "VloU", "Vo2hU", "CIGAUviSbI", "CIMAUviSbI", "RenIAUviSbI", "IMMviSoP", "AceEaviSoP", "AEaviSoP", "LEaviSoP", "CVBMviSoP", "FlMviSoP", "Hsv1IAUviSbI", "PmvEviBbAc", "CVD2MviSoP", "RfUviSoP", "TUviSoPbDl00mL", "SgoU", "M1liBfbMc", "EviBfbAc", "LUviSoP", "FUviSoPb2I", "ClcdMviSoP", "CVD3MviSoP", "ShbgMviSoP", "CiHMviSoP", "ChMviB", "ChlrMviSoP", "PrgMviSoP", "CbsUviSoP", "EEMviSoP", "PSaniPppbCa", "AaniPppbCm", "PCaniPppbCm", "SMviSoP", "APtiBfbE", "MgMviSoP", "TTfMviSoP", "TTMviSoP", "AMviSoP", "MHtiB", "CMviU", "CHtiB", "EviBbAc", "HVFoBbAc", "HMviB", "ChlsMviSoP", "CiLMviSoPbc", "CiLMviSoPbDa", "PrlMviSoP", "APtPmfiSoPbE", "IbcuMviSoP", "TTFMviSoP", "CiMviSoPbIsmeI", "ClcmMviSoP", "TFMviSoP", "TsMviSoP", "TfwbMviSoP", "AlaEaviSoPbWP5P", "AsaEaviSoPbWP5P", "BdMviSoP", "BtMviSoP", "A1FMviSoP", "GgtEaviSoP", "EmchEmbAc", "EmcvEvbAc", "EmchcMvbAc", "IrMviSoP", "IsMFiSoP"),
                   labels=c("Creatinine ", "Creatinine ", "Urea nitrogen", "Ferritin ", "dRVVT ", "Homocysteine ", "Urate ", "Natriuretic peptide", "Natriuretic peptide", "Parathyrin", "Protein ", "Protein ", "Microalbumin ", "Microalbumin", "Glucose ", "Hemoglobin A1c", "Glucose mean", "Glucose ", "Glucose ", "Oxygen saturation", "Oxygen ", "Fractional oxyhemoglobin", "Creatine kinase", "Creatine kinase", "Oxygen", "Immature granulocytes", "Leukocytes ", "Neutrophils ", "Myelocytes", "Metamyelocytes", "Metamyelocytes ", "Myelocytes ", "Neutrophils", "Neutrophils", "Glucose ", "Glucose ", "Glucose ", "C peptide", "Insulin ", "Triglyceride ", "Beta globulin", "Beta globulin", "Fibrinogen ", "Platelets ", "Alpha 1", "Ceruloplasmin ", "Erythrocyte distribution", "C reactive", "C reactive", "Immature granulocytes", "Carcinoembryonic Ag", "Digoxin ", "Methylmalonate ", "Creatine kinase", "Cortisol ", "Cancer Ag", "Lactate dehydrogenase", "Reticulocytes", "Prostate Specific", "Prostate Specific", "Prostate specific", "Base deficit", "Anion gap", "Phosphate ", "Potassium ", "Base excess", "Carbon dioxide", "Carbon dioxide", "Bicarbonate ", "Carbon dioxide", "IgA ", "IgG ", "Gamma globulin", "pH of", "Protein ", "Volume of", "Volume of", "Cardiolipin IgG", "Cardiolipin IgM", "Ribonucleoprotein extractable", "IgM ", "Angiotensin converting", "Amylase ", "Lipase ", "Cobalamin ", "Folate ", "Herpes simplex", "Platelet mean", "Calciferol ", "Rheumatoid factor", "Thyrotropin ", "Specific gravity", "Monocytes", "Erythrocytes ", "Lutropin ", "Follitropin ", "Calcidiol ", "Cholecalciferol ", "Sex hormone", "Cholesterol in", "Chloride ", "Chloride ", "Progesterone ", "Choriogonadotropin", "Estradiol ", "Protein S", "Antithrombin actual", "Protein C", "Sodium ", "Albumin", "Magnesium ", "Thyroxine ", "Thyroxine ", "Aldosterone ", "Methemoglobin", "Calcium ", "Carboxyhemoglobin", "Erythrocytes ", "Hematocrit ", "Hemoglobin ", "Cholesterol ", "Cholesterol in", "Cholesterol in", "Prealbumin ", "Albumin", "Iron binding", "Triiodothyronine ", "Calcium", "Calcium ", "Testosterone Free", "Testosterone ", "Testosterone", "Alanine aminotransferase", "Aspartate aminotransferase", "Bilirubin", "Bilirubin", "Alpha", "Gamma glutamyl", "Erythrocyte mean", "Erythrocyte mean", "Erythrocyte mean", "Iron ", "Iron saturation")
  )

png("~/plots/imputation/labPanels/ptCountsPerLabCorrelationClustDisc.png", width = 16, height=9, res = 300, units = "in")
cors.plot.disc
dev.off()

hist(name.count.cors.labs.per.patient$correlation,breaks = 1000)+
  abline(v = .87, col="red")

### Set Neutrophil and Hemoglobin slightly higher so that CBC-Diff is complete
name.count.cors.labs.per.patient$correlation[c(2,144)]<-.88

panel.cors<-name.count.cors.labs.per.patient[name.count.cors.labs.per.patient$correlation>.87,]
is.cluster<-name.count.cors.labs.per.patient
is.cluster$clust<-rep(0, nrow(is.cluster))
is.cluster$clust[is.cluster$correlation>.87]<-1

cluster.matrix<-dcast(is.cluster, Var1~Var2, fun.aggregate = max, value.var="clust")
loincs<-loincToEnglish$code[match(x = colnames(cluster.matrix), table = loincToEnglish$abbrevs)]
colnames(cluster.matrix)<-loincs
cluster.matrix[,1]<-loincs[-1]

write.table(cluster.matrix, file = "~/data/imputation/labPanelMembershipMatrix.txt", sep = "\t", row.names = F, quote = F)



