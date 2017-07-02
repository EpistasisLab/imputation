library(reshape2)
library(ggplot2)
library(gridExtra)

# MCAR
mcar_scores<-read.csv('/data/prediction_scores/mcar.csv')
print(dim(mcar_scores))

mcar_scores <- mcar_scores[, !(names(mcar_scores) %in% "X")]
colnames(mcar_scores) <- c("10%", "20%", "30%", "40%", "50%")
mcar_df <- melt(mcar_scores)
colnames(mcar_df) <- c("Spikein", "ROC_AUC")

threeA <- ggplot(mcar_df, aes(x=Spikein, y=ROC_AUC, color=Spikein)) +
  theme_bw()+
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A.", y="ROC AUC", x="Spike-in Percentage") + scale_y_continuous(limits = c(0.5, 1))

# MAR
mar_scores<-read.csv('/data/prediction_scores/mar.csv')
print(dim(mar_scores))

mar_scores <- mar_scores[, !(names(mar_scores) %in% "X")]
colnames(mar_scores) <- c("1", "2", "3", "4")
mar_df <- melt(mar_scores)
colnames(mar_df) <- c("Quartile", "ROC_AUC")

threeB <- ggplot(mar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
  theme_bw()+
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title="B.", y="ROC AUC", x="Quartile") + scale_y_continuous(limits = c(0.5, 1))

# MNAR
mnar_scores<-read.csv('/data/prediction_scores/mnar.csv')
print(dim(mnar_scores))

mnar_scores <- mnar_scores[, !(names(mnar_scores) %in% "X")]
colnames(mnar_scores) <- c("1", "2", "3", "4")
mnar_df <- melt(mnar_scores)
colnames(mnar_df) <- c("Quartile", "ROC_AUC")

threeC <- ggplot(mnar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
  theme_bw()+
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) + 
  labs(title="C.", y="ROC AUC", x="Quartile") + scale_y_continuous(limits = c(0.5, 1))


# figure 2 grid
library(gridExtra)
png("./figures/figure_3.png", width = 8, height = 3, res = 300, units = "in")
print(grid.arrange(arrangeGrob(threeA, threeB, threeC, ncol=3)))
dev.off()
