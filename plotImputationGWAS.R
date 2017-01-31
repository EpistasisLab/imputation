library(data.table)
library(reshape2)
library(plyr)
library(ggplot2)
library(qqman)
library(MASS)
source("~/Dropbox/BTI/scripts/plotting/manhattanMakeD.R")
source("~/Dropbox/BTI/scripts/plotting/manhattan.R")
source("~/Dropbox/BTI/scripts/plotting/manhattan.grasp.comp.R")
source("~/Dropbox/BTI/scripts/plotting/manhattan.gwascentral.comp.R")

data.observed<-read.table("~/Downloads/observedOnly.PLATO.out", header=T, sep="\t", colClasses = c("factor","character","character","NULL","numeric","numeric","NULL","NULL","NULL","NULL","NULL","NULL","numeric","NULL","numeric"))
data.imputed<-read.table("~/Downloads/imputedOnly.PLATO.out", header=T, sep="\t", colClasses = c("factor","character","character","NULL","numeric","numeric","NULL","NULL","NULL","NULL","NULL","NULL","numeric","NULL","numeric"))
data.all<-read.table("~/Downloads/observedPlusImputed.PLATO.out", header=T, sep="\t", colClasses = c("factor","character","character","NULL","numeric","numeric","NULL","NULL","NULL","NULL","NULL","NULL","numeric","NULL","numeric"))

data.sig.observed<-data.observed[which(data.observed$Overall_Pval_.LRT.<.1),]
data.sig.imputed<-data.imputed[which(data.imputed$Overall_Pval_.LRT.<.1),]
data.sig.all<-data.all[which(data.all$Overall_Pval_.LRT.<.1),]


### Make manhattan plots for all observed data
for(i in levels(data.sig.observed$Outcome)){
gwas.obs<-subset(data.sig.observed, Outcome==i)
gwas.obs<-data.frame(SNP=gwas.obs$Var1_ID, 
                    CHR=unlist(strsplit(gwas.obs$Var1_Pos, ":"))[(1:nrow(gwas.obs))*2-1], 
                    BP=unlist(strsplit(gwas.obs$Var1_Pos, ":"))[(1:nrow(gwas.obs))*2],
                    P=gwas.obs$Overall_Pval_.LRT.)

gwas.obs$CHR<-mapvalues(gwas.obs$CHR, from = c("X", "M"), to = c("23", "24"))
gwas.obs$CHR<-as.integer(as.character(gwas.obs$CHR))
gwas.obs$BP<-as.integer(as.character(gwas.obs$BP))
gwas.obs<-gwas.obs[order(gwas.obs$P),]
qvalues.obs<-p.adjust(gwas.obs$P, "BH")

png(paste("~/plots/imputation/gwas/manhattan/", i,".observed.png", sep=""), width = 16, height=9, units = "in", res = 300)
manhattan(gwas.obs, col = alpha(c("#009E73", "#0072B2"), .4), main=paste(i, " Observed"), cex=1.2)
dev.off()
}

### Make manhattan plots for all imputed data
for(i in levels(data.sig.imputed$Outcome)){
  gwas.imp<-subset(data.sig.imputed, Outcome==i)
  gwas.imp<-data.frame(SNP=gwas.imp$Var1_ID, 
                       CHR=unlist(strsplit(gwas.imp$Var1_Pos, ":"))[(1:nrow(gwas.imp))*2-1], 
                       BP=unlist(strsplit(gwas.imp$Var1_Pos, ":"))[(1:nrow(gwas.imp))*2],
                       P=gwas.imp$Overall_Pval_.LRT.)
  
  gwas.imp$CHR<-mapvalues(gwas.imp$CHR, from = c("X", "M"), to = c("23", "24"))
  gwas.imp$CHR<-as.integer(as.character(gwas.imp$CHR))
  gwas.imp$BP<-as.integer(as.character(gwas.imp$BP))
  gwas.imp<-gwas.imp[order(gwas.imp$P),]
  qvalues.imp<-p.adjust(gwas.imp$P, "BH")
  
  png(paste("~/plots/imputation/gwas/manhattan/", i,".imputed.png", sep=""), width = 16, height=9, units = "in", res = 300)
  manhattan(gwas.imp, col = alpha(c("#009E73", "#0072B2"), .4), main=paste(i, " Imputed"), cex=1.2)
  dev.off()
}

### Make manhattan plots for all pooled data 
for(i in levels(data.sig.all$Outcome)){
  gwas.all<-subset(data.sig.all, Outcome==i)
  gwas.all<-data.frame(SNP=gwas.all$Var1_ID, 
                       CHR=unlist(strsplit(gwas.all$Var1_Pos, ":"))[(1:nrow(gwas.all))*2-1], 
                       BP=unlist(strsplit(gwas.all$Var1_Pos, ":"))[(1:nrow(gwas.all))*2],
                       P=gwas.all$Overall_Pval_.LRT.)
  
  gwas.all$CHR<-mapvalues(gwas.all$CHR, from = c("X", "M"), to = c("23", "24"))
  gwas.all$CHR<-as.integer(as.character(gwas.all$CHR))
  gwas.all$BP<-as.integer(as.character(gwas.all$BP))
  gwas.all<-gwas.all[order(gwas.all$P),]
  qvalues.all<-p.adjust(gwas.all$P, "BH")
  
  png(paste("~/plots/imputation/gwas/manhattan/", i,".observedAndImputed.png", sep=""), width = 16, height=9, units = "in", res = 300)
  manhattan(gwas.all, col = alpha(c("#009E73", "#0072B2"), .4), main=paste(i, " Observed and Imputed"), cex=1.2)
  dev.off()
}


### Make overlayed manhattan plots

for(i in levels(data.sig.all$Outcome)){

gwas.obs<-subset(data.sig.observed, Outcome==i)
gwas.obs<-data.frame(SNP=gwas.obs$Var1_ID, 
                     CHR=unlist(strsplit(gwas.obs$Var1_Pos, ":"))[(1:nrow(gwas.obs))*2-1], 
                     BP=unlist(strsplit(gwas.obs$Var1_Pos, ":"))[(1:nrow(gwas.obs))*2],
                     P=gwas.obs$Overall_Pval_.LRT.)

gwas.obs$CHR<-mapvalues(gwas.obs$CHR, from = c("X", "M"), to = c("23", "24"))
gwas.obs$CHR<-as.integer(as.character(gwas.obs$CHR))
gwas.obs$BP<-as.integer(as.character(gwas.obs$BP))
gwas.obs<-gwas.obs[order(gwas.obs$P),]
qvalues.obs<-p.adjust(gwas.obs$P, "BH")
gwas.obs$P[gwas.obs$P<1e-25]<-1e-25

gwas.imp<-subset(data.sig.imputed, Outcome==i)
gwas.imp<-data.frame(SNP=gwas.imp$Var1_ID, 
                     CHR=unlist(strsplit(gwas.imp$Var1_Pos, ":"))[(1:nrow(gwas.imp))*2-1], 
                     BP=unlist(strsplit(gwas.imp$Var1_Pos, ":"))[(1:nrow(gwas.imp))*2],
                     P=gwas.imp$Overall_Pval_.LRT.)

gwas.imp$CHR<-mapvalues(gwas.imp$CHR, from = c("X", "M"), to = c("23", "24"))
gwas.imp$CHR<-as.integer(as.character(gwas.imp$CHR))
gwas.imp$BP<-as.integer(as.character(gwas.imp$BP))
gwas.imp<-gwas.imp[order(gwas.imp$P),]
qvalues.imp<-p.adjust(gwas.imp$P, "BH")
gwas.imp$P[gwas.imp$P<1e-25]<-1e-25

gwas.all<-subset(data.sig.all, Outcome==i)
gwas.all<-data.frame(SNP=gwas.all$Var1_ID, 
                     CHR=unlist(strsplit(gwas.all$Var1_Pos, ":"))[(1:nrow(gwas.all))*2-1], 
                     BP=unlist(strsplit(gwas.all$Var1_Pos, ":"))[(1:nrow(gwas.all))*2],
                     P=gwas.all$Overall_Pval_.LRT.)

gwas.all$CHR<-mapvalues(gwas.all$CHR, from = c("X", "M"), to = c("23", "24"))
gwas.all$CHR<-as.integer(as.character(gwas.all$CHR))
gwas.all$BP<-as.integer(as.character(gwas.all$BP))
gwas.all<-gwas.all[order(gwas.all$P),]
qvalues.all<-p.adjust(gwas.all$P, "BH")
gwas.all$P[gwas.all$P<1e-25]<-1e-25

png(paste("~/plots/imputation/gwas/manhattan/overlay/", i,".overlay.png", sep=""), width = 16, height=9, units = "in", res = 300)
manhattan(gwas.obs, col = alpha("#000000", .8), main=paste(i, " Overlay"), cex.main=2, cex.lab=1.3, cex=1.2, ylim=c(0,30))
d<-manhattanMakeD(x=gwas.all)
with(d, points(pos, logp, pch = 12, col = alpha("#56B4E9", 1), cex=.8))
d<-manhattanMakeD(x=gwas.imp)
with(d, points(pos, logp, pch = 20, col = alpha("#E69F00", 1)))
legend("topleft", c("Observed", "Imputed", "Pooled"), cex=1.3, pt.cex=3, pch=c(8,20,12),col=c(alpha("#000000", .8), alpha("#E69F00", 1), alpha("#56B4E9", 1)), bty="n")
dev.off()

}
