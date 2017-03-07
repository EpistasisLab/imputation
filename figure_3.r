library(reshape2)
library(ggplot2)
library(gridExtra)

setwd('/home/brett/code/imputation/')

# MCAR
mcar_scores<-read.csv('./output/imputation_scores/mcar.csv')
print(dim(mcar_scores))

ggplot(mcar_scores, aes(x=Method, y=RMSE, color=Percent.Missing)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A.", y="ROC AUC", x="Spike-in Percentage")

# MNAR
mnar_scores<-read.csv('./output/imputation_scores/mnar.csv')
print(dim(mnar_scores))

