library(reshape2)
library(ggplot2)

setwd('/home/brett/code/imputation/')

# MCAR
mcar_scores<-read.csv('./data/prediction_scores/mcar.csv')
print(dim(mcar_scores))

mcar_scores <- mcar_scores[, !(names(mcar_scores) %in% "X")]
colnames(mcar_scores) <- c("10%", "20%", "30%", "40%", "50%")
mcar_df <- melt(mcar_scores)
colnames(mcar_df) <- c("Spikein", "ROC_AUC")


ggplot(mcar_df, aes(x=Spikein, y=ROC_AUC, color=Spikein)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1)

# MAR
mar_scores<-read.csv('./data/prediction_scores/mar.csv')
print(dim(mar_scores))

mar_scores <- mar_scores[, !(names(mar_scores) %in% "X")]
boxplot(mar_scores, horizontal=FALSE)

# MNAR 
mnar_scores<-read.csv('./data/prediction_scores/mnar.csv')
print(dim(mnar_scores))

mnar_scores <- mnar_scores[, !(names(mnar_scores) %in% "X")]
boxplot(mnar_scores, horizontal=FALSE)

# all scores
scores<-read.csv("./data/prediction_scores/all_labs.csv")
print(dim(scores))

scores <- scores[, !(names(scores) %in% "X")]
boxplot(scores, horizontal=FALSE)

# top 28
select_scores<-read.csv("./data/prediction_scores/real28.csv")
print(dim(select_scores))

select_scores <- select_scores[, !(names(select_scores) %in% "X")]
boxplot(select_scores, horizontal=FALSE)
