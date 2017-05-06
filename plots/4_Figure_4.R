# match
match_scores <- read.csv('./output/imputation_scores/match.csv')
print(dim(match_scores))

min_score = min(match_scores['MSE'])
max_score = max(match_scores['MSE'])

methods <- c("r_sample", "r_mean", "simple_median", "knn_751", "svd_2", "si_s_8", "mice_col_lambda_reg_1",
             "mice_pmm_X", "r_norm.predict", "r_pmm", "r_rf", "r_norm")
labels <- c('Random Sample', 'Mean', 'Median', 'KNN', 'SVD', 'SoftImpute', 'MICE (col)',
            'MICE (pmm)', 'MICE (norm.pred)', 'MICE (R pmm)', 'MICE (RF)', 'MICE (Norm)')

scores <- subset(match_scores, Method %in% methods)
scores$Method <- factor(scores$Method, levels=methods)

plot1 = ggplot(scores, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. Matching Patient Comparison", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))

# load 1 10k example
by_var <- read.csv('./output/imputation_scores/match_by_var.csv')
by_var$Var_id <- factor(by_var$Var_id)
by_var$Method <- factor(by_var$Method, levels=methods)
by_var_subset <- subset(by_var, Method %in% methods)

print(dim(by_var_subset))
plot2 = ggplot(by_var_subset, aes(x=Method, y=MSE, color=Var_id)) + 
  stat_summary(fun.y = function(y){(y)}, geom = "point") +
  ggtitle("Root Mean Squared Error By Algorithm and Lab")+
  geom_hline(yintercept = sqrt(2))+
  theme_bw() +
  ylab("RMSE")+
  scale_x_discrete(labels=labels) +
  theme(axis.text.x = element_text(angle=45, hjust = 1))

png("./plots/fig_4.png", width = 8, height = 10, res = 300, units = "in")
print(grid.arrange(top="Comparison on realistic spike-in",
                   arrangeGrob(plot1, plot2, nrow=2, ncol=1), nrow=1, ncol=1))
dev.off()

# matchas
match_scores <- read.csv('./output/imputation_scores/match_old.csv')
print(dim(match_scores))

methods <- c("r_sample", "r_mean", "simple_median", "knn_751", "svd_2", "si_s_8", "mice_col_lambda_reg_1",
             "mice_pmm_X", "r_norm.predict", "r_pmm", "r_rf", "r_norm")
labels <- c('Random Sample', 'Mean', 'Median', 'KNN', 'SVD', 'SoftImpute', 'MICE (col)',
            'MICE (pmm)', 'MICE (norm.pred)', 'MICE (R pmm)', 'MICE (RF)', 'MICE (Norm)')

scores <- subset(match_scores, Method %in% methods)
scores$Method <- factor(scores$Method, levels=methods)


min_score = min(scores['MSE'])
max_score = max(scores['MSE'])

plot1 = ggplot(scores, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. Matching Patient Comparison", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/fig_4_default_pred_matrix.png", width = 8, height = 10, res = 300, units = "in")
print(grid.arrange(top="Comparison on realistic spike-in",
                   arrangeGrob(plot1, nrow=2, ncol=1), nrow=1, ncol=1))
dev.off()
