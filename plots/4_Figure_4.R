# match
match_scores <- read.csv('./output/imputation_scores/match.csv')
print(dim(match_scores))

min_score = min(match_scores['MSE'])
max_score = max(match_scores['MSE'])

methods <- c("r_sample", "r_mean", "simple_median", "knn_751", "svd_2", "si_s_8", "mice_col_lambda_reg_1",
             "mice_pmm_X", "r_norm.predict", "r_pmm", "r_rf", "r_norm")
labels <- c('Random Sample', 'Mean', 'Median', 'KNN', 'SVD', 'SoftImpute', 'MICE (col)',
            'MICE (pmm)', 'MICE (norm.pred)', 'MICE (R pmm)', 'MICE (RF)', 'MICE (Norm)')

scores <- subset(match_scores, Method %in% knn_methods)
sub_scores$Method <- factor(scores$Method, levels=methods)

plot1 = ggplot(sub_scores, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. KNN", y="RMSE", x="K-neighbors") +
  scale_x_discrete(labels=knn_labels) + 
  scale_y_continuous(limits=c(min_score, 1.5)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/fig_4_.png", width = 8, height = 10, res = 300, units = "in")
print(grid.arrange(top="Comparison on realistic spike-in",
                   arrangeGrob(plot1, nrow=2, ncol=1), nrow=1, ncol=1))
dev.off()

