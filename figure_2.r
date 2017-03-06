library(reshape2)
library(ggplot2)

# setwd('/home/brett/code/imputation/')
setwd('/Users/brett/code/imputation/')

# MCAR
mcar_scores<-read.csv('./data/prediction_scores/mcar.csv')
print(dim(mcar_scores))

mcar_scores <- mcar_scores[, !(names(mcar_scores) %in% "X")]
colnames(mcar_scores) <- c("10%", "20%", "30%", "40%", "50%")
mcar_df <- melt(mcar_scores)
colnames(mcar_df) <- c("Spikein", "ROCAUC")

ggplot(mcar_df, aes(x=Spikein, y=ROC_AUC, color=Spikein)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1)

# MAR
mar_scores<-read.csv('./data/prediction_scores/mar.csv')
print(dim(mar_scores))

mar_scores <- mar_scores[, !(names(mar_scores) %in% "X")]
colnames(mar_scores) <- c("Quartile 1", "Quartile 2", "Quartile 3", "Quartile 4")
mar_df <- melt(mar_scores)
colnames(mar_df) <- c("Quartile", "ROC_AUC")

ggplot(mar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1)

# MNAR 
mnar_scores<-read.csv('./data/prediction_scores/mnar.csv')
print(dim(mnar_scores))

mnar_scores <- mnar_scores[, !(names(mnar_scores) %in% "X")]
colnames(mnar_scores) <- c("Quartile 1", "Quartile 2", "Quartile 3", "Quartile 4")
mnar_df <- melt(mnar_scores)
colnames(mnar_df) <- c("Quartile", "ROC_AUC")

ggplot(mnar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1)

# all scores
scores<-read.csv("./data/prediction_scores/real_all_labs.csv")
print(dim(scores))

drops <- c("X")
scores[ , !(names(scores) %in% drops)]
boxplot(scores)

scores_df <- melt(scores)
colnames(scores_df) <- c("Lab", "ROC_AUC")
ggplot(scores_df, aes(x=Lab, y=ROC_AUC, color=Lab)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1)

# top 28
select_scores<-read.csv("./data/prediction_scores/real28.csv")
print(dim(select_scores))

select_scores <- select_scores[, !(names(select_scores) %in% "X")]
boxplot(select_scores, horizontal=FALSE)
