library(reshape2)
library(ggplot2)
library(gridExtra)
library(grid)

setwd('/home/brett/code/imputation/')
#setwd('/Users/brett/code/imputation/')

mcar_scores <- read.csv('./output/imputation_scores/mcar.csv')
spikein <- c(0.1, 0.2, 0.3, 0.4, 0.5)
methods <- c("r_sample", "r_mean", "simple_median", "knn_751", "svd_2", "si_s_8", "mice_col_lambda_reg_1",
             "mice_pmm_X", "r_norm.predict", "r_pmm", "r_rf", "r_norm")
labels <- c('Random Sample', 'Mean', 'Median', 'KNN', 'SVD', 'SoftImpute', 'MICE (col)',
            'MICE (pmm)', 'MICE (norm.pred)', 'MICE (R pmm)', 'MICE (RF)', 'MICE (Norm)')

scores <- subset(mcar_scores, Method %in% methods)
scores$Method <- factor(scores$Method, levels=methods)

min_score = min(scores['MSE'])
max_score = max(scores['MSE'])

mcar_subset <- subset(scores)
plot1 = ggplot(mcar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. MCAR", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(0, 2)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, hjust = 1))

mar_scores <- read.csv('./output/imputation_scores/mar.csv')
scores <- subset(mar_scores, Method %in% methods)
scores$Method <- factor(scores$Method, levels=methods)

min_score = min(scores['MSE'])
max_score = max(scores['MSE'])

mar_subset <- subset(scores)
mar_plot1 = ggplot(mar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. MAR", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(0, 2)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, hjust = 1))

mnar_scores <- read.csv('./output/imputation_scores/mnar.csv')
scores <- subset(mnar_scores, Method %in% methods)
scores$Method <- factor(scores$Method, levels=methods)

min_score = min(scores['MSE'])
max_score = max(scores['MSE'])

mnar_subset <- subset(scores, Quartile==0)
mnar_plot1 = ggplot(mnar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. MNAR", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(0, 2)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/figure_3.png", width = 7.5, height = 5, res = 300, units = "in")
print(grid.arrange(top="Simulation Spike-in Experiments",
                   arrangeGrob(plot1, mar_plot1, mnar_plot1, nrow=1, ncol=3), nrow=1, ncol=1))
dev.off()