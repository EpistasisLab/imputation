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
colnames(mcar_df) <- c("Spikein", "ROC_AUC")

png("./plots/figure_2a.png", width = 12, height = 7, res = 300, units = "in")
  print(ggplot(mcar_df, aes(x=Spikein, y=ROC_AUC, color=Spikein)) +
    geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
    labs(title = "Missing Completely at Random Simulation Missingess Prediction", y="ROC AUC", x="Spike-in Percentage")
  )
dev.off()

twoA <- ggplot(mcar_df, aes(x=Spikein, y=ROC_AUC, color=Spikein)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "Missing Completely at Random Simulation Missingess Prediction", y="ROC AUC", x="Spike-in Percentage")

png("./plots/supp_figure_2a.png", width = 12, height = 7, res = 300, units = "in")
print(ggplot(mcar_df, aes(x=Spikein, y=ROC_AUC, color=Spikein)) +
        geom_violin() +
        labs(title = "Missing Completely at Random Simulation Missingess", y="ROC AUC", x="Spike-in Percentage")
)
dev.off()

# MAR
mar_scores<-read.csv('./data/prediction_scores/mar.csv')
print(dim(mar_scores))

mar_scores <- mar_scores[, !(names(mar_scores) %in% "X")]
colnames(mar_scores) <- c("Quartile 1", "Quartile 2", "Quartile 3", "Quartile 4")
mar_df <- melt(mar_scores)
colnames(mar_df) <- c("Quartile", "ROC_AUC")

png("./plots/figure_2b.png", width = 12, height = 7, res = 300, units = "in")
print(ggplot(mar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title="Missing At Random Simulation Missingness Prediction", y="ROC AUC", x="Quartile")
)
dev.off()

twoB <- ggplot(mar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title="Missing At Random Simulation Missingness Prediction", y="ROC AUC", x="Quartile")

png("./plots/supp_figure_2b.png", width = 12, height = 7, res = 300, units = "in")
print(ggplot(mar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
  geom_violin() +
  labs(title="Missing Not at Random Simulation Missingness Prediction", y="ROC AUC", x="Quartile")
)
dev.off()

# MNAR 
mnar_scores<-read.csv('./data/prediction_scores/mnar.csv')
print(dim(mnar_scores))

mnar_scores <- mnar_scores[, !(names(mnar_scores) %in% "X")]
colnames(mnar_scores) <- c("Quartile 1", "Quartile 2", "Quartile 3", "Quartile 4")
mnar_df <- melt(mnar_scores)
colnames(mnar_df) <- c("Quartile", "ROC_AUC")

png("./plots/figure_2c.png", width = 12, height = 7, res = 300, units = "in")
print(ggplot(mnar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) + 
  labs(title="Missing Not at Random Simulation Missingness Prediction", y="ROC AUC", x="Quartile")
) 
dev.off()

twoC <- ggplot(mnar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) + 
  labs(title="Missing Not at Random Simulation Missingness Prediction", y="ROC AUC", x="Quartile")

png("./plots/supp_figure_2c.png", width = 12, height = 7, res = 300, units = "in")
print(ggplot(mnar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
        geom_violin() +
        labs(title="Missing Not at Random Simulation Missingness Prediction", y="ROC AUC", x="Quartile")
)
dev.off()

# all scores
scores<-read.csv("./data/prediction_scores/real_all_labs.csv")
print(dim(scores))

drops <- c("X")
scores[ , !(colnames(scores) %in% drops)]

#2d
scores_df <- melt(scores)
colnames(scores_df) <- c("Lab", "ROC_AUC")

png("./plots/figure_2d.png", width = 12, height = 7, res = 300, units = "in")
print(ggplot(scores_df, aes(x=Lab, y=ROC_AUC, color=Lab)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1)
)

#2e
png("./plots/figure_2e.png", width = 12, height = 7, res = 300, units = "in")
print(ggplot(scores_df, aes(x=Lab, y=ROC_AUC, color=Lab)) +
      geom_violin()
)

# top 28
select_scores<-read.csv("./data/prediction_scores/real28.csv")
print(dim(select_scores))

select_scores <- select_scores[, !(names(select_scores) %in% "X")]
select_scores_df <- melt(select_scores)
colnames(select_scores_df) <- c("Lab", "ROC_AUC")

#2f
png("./plots/figure_2f.png", width = 12, height = 7, res = 300, units = "in")
print(ggplot(select_scores_df, aes(x=Lab, y=ROC_AUC, color=Lab)) +
        geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) + 
        labs(title="Most Complete 28 Labs Missingness Prediction", y="ROC AUC", x="Lab")
) 
dev.off()

#2g
png("./plots/figure_2g.png", width = 12, height = 7, res = 300, units = "in")
print(ggplot(select_scores_df, aes(x=Lab, y=ROC_AUC, color=Lab)) +
        geom_violin() + 
        labs(title="Most Complete 28 Labs", y="ROC AUC", x="Lab")
) 
dev.off()

