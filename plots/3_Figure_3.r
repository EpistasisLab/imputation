library(reshape2)
library(ggplot2)
library(gridExtra)
library(grid)

setwd('/home/brett/code/imputation/')
#setwd('/Users/brett/code/imputation/')

mcar_scores <- read.csv('./output/imputation_scores/mcar.csv')
spikein <- c(0.1, 0.2, 0.3, 0.4, 0.5)
methods <- c("r_sample", "r_mean", "simple_median", "knn_751", "svd_2", "si_8", "mice_col_lambda_reg_1",
             "mice_pmm_X", "r_norm.predict", "r_pmm", "r_rf", "r_norm")
labels <- c('Random Sample', 'Mean', 'Median', 'KNN', 'SVD', 'SoftImptue', 'MICE (col)',
            'MICE (pmm)', 'MICE (norm.pred)', 'MICE (R pmm)', 'MICE (RF', 'MICE (Norm)')

scores <- subset(mcar_scores, Method %in% methods)
scores$Method <- factor(scores$Method, levels=methods)

min_score = min(scores['MSE'])
max_score = max(scores['MSE'])

mcar_subset <- subset(scores, Percent.Missing==0.1)
plot1 = ggplot(mcar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

mcar_subset <- subset(scores, Percent.Missing==0.2)
plot2 = ggplot(mcar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. 0.2", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

mcar_subset <- subset(scores, Percent.Missing==0.3)
plot3 = ggplot(mcar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. 0.3", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

mcar_subset <- subset(scores, Percent.Missing==0.4)
plot4 = ggplot(mcar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "D. 0.4", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

mcar_subset <- subset(scores, Percent.Missing==0.5)
plot5 = ggplot(mcar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "E. 0.5", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="right",
        axis.text.x = element_blank())

mar_scores <- read.csv('./output/imputation_scores/mar.csv')
scores <- subset(mar_scores, Method %in% methods)
scores$Method <- factor(scores$Method, levels=methods)

min_score = min(scores['MSE'])
max_score = max(scores['MSE'])

mar_subset <- subset(scores, Quartile==0)
mar_plot1 = ggplot(mar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. Quartile 1", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

mar_subset <- subset(scores, Quartile==1)
mar_plot2 = ggplot(mar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. Quartile 2", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

mar_subset <- subset(scores, Quartile==2)
mar_plot3 = ggplot(mar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. Quartile 3", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

mar_subset <- subset(scores, Quartile==3)
mar_plot4 = ggplot(mar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "D. Quartile 4", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

mnar_scores <- read.csv('./output/imputation_scores/mnar.csv')
scores <- subset(mnar_scores, Method %in% methods)
scores$Method <- factor(scores$Method, levels=methods)

min_score = min(scores['MSE'])
max_score = max(scores['MSE'])

mnar_subset <- subset(scores, Quartile==0)
mnar_plot1 = ggplot(mnar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. Quartile 1", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

mnar_subset <- subset(scores, Quartile==1)
mnar_plot2 = ggplot(mnar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. Quartile 2", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

mnar_subset <- subset(scores, Quartile==2)
mnar_plot3 = ggplot(mnar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. Quartile 3", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

mar_subset <- subset(scores, Quartile==3)
mnar_plot4 = ggplot(mnar_subset, aes(x=Method, y=MSE, color=Method)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "D. Quartile 4", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_blank())

grid_arrange_shared_legend <- function(..., nrow = 1, ncol = length(list(...)), position = c("bottom", "right")) {
  plots <- list(...)
  position <- match.arg(position)
  g <- ggplotGrob(plots[[1]] + theme(legend.position = position))$grobs
  legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
  lheight <- sum(legend$height)
  lwidth <- sum(legend$width)
  gl <- lapply(plots, function(x) x + theme(legend.position = "none"))
  gl <- c(gl, nrow = nrow, ncol = ncol)
  combined <- switch(position,
                     "bottom" = arrangeGrob(do.call(arrangeGrob, gl),
                                            legend,
                                            ncol = 1,
                                            heights = unit.c(unit(1, "npc") - lheight, lheight)),
                     "right" = arrangeGrob(do.call(arrangeGrob, gl),
                                           legend,
                                           ncol = 2,
                                           widths = unit.c(unit(1, "npc") - lwidth, lwidth)))
  grid.newpage()
  grid.draw(combined)
}

grid_arrange_shared_legend(plot1, plot2, plot3, plot4, plot5, mar_plot1, mar_plot2, mar_plot3, mar_plot4, 
                           mnar_plot1, mnar_plot2, mnar_plot3, mnar_plot4, nrow=3, ncol=5, position="bottom")
#png("./plots/3_MCAR.png", width = 7.5, height = 5, res = 300, units = "in")
#print(grid_arrange_shared_legend(plot1, plot2, plot3, plot4, plot5))
#dev.off()