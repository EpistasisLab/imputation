# mar
match_scores <- read.csv('./output/imputation_scores/match.csv')
print(dim(match_scores))

min_score = min(match_scores['MSE'])
max_score = max(match_scores['MSE'])

knn_methods <- c("knn_1", "knn_3", "knn_9", "knn_15", "knn_30", "knn_81", "knn_243", "knn_751", "knn_2000", "knn_6000")
#knn_labels <- c('KNN 1', 'KNN 3', 'KNN 9', 'KNN 15', 'KNN 30', 'KNN 81', 'KNN 243', 'KNN 751', 'KNN 2000', 'KNN 6000')
knn_labels <- c('1', '3', '9', '15', '30', '81', '243', '751', '2000', '6000')

knn_scores <- subset(match_scores, Method %in% knn_methods)
knn_scores$Method <- factor(knn_scores$Method, levels=knn_methods)

knn_subset <- subset(knn_scores)
knn = ggplot(knn_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. KNN", y="RMSE", x="K-neighbors") +
  scale_x_discrete(labels=knn_labels) + 
  scale_y_continuous(limits=c(min_score, 1.5)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, hjust = 1))

svd_methods <- c("svd_1", "svd_2", "svd_3", "svd_4", "svd_5", "svd_6", "svd_7", "svd_8", "svd_9", "svd_10", 
                 "svd_11", "svd_12", "svd_13", "svd_14", "svd_15", "svd_16", "svd_17", "svd_18", "svd_19", "svd_20",
                 "svd_21", "svd_22", "svd_23", "svd_24")
svd_labels <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18",
                "19", "20", "21", "22", "23", "24")

svd_scores <- subset(match_scores, Method %in% svd_methods)
svd_scores$Method <- factor(svd_scores$Method, levels=svd_methods)

svd_subset <- subset(svd_scores)
svd = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. SVD", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

si_methods <- c("si_s_half", "si_s_1", "si_s_2", "si_s_4", "si_s_8", "si_s_16", "si_s_32", "si_s_64", "si_s_128")
si_labels <- c("0.5", "1", "2", "4", "8", "16", "32", "64", "128")

si_scores <- subset(match_scores, Method %in% si_methods)
si_scores$Method <- factor(si_scores$Method, levels=si_methods)

si_subset <- subset(si_scores)
si = ggplot(si_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. Soft Impute", y="RMSE", x="Rank") +
  scale_x_discrete(labels=si_labels) + 
  scale_y_continuous(limits=c(min_score, 1.5)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_methods <- c("MICE", "mice_col_lambda_reg_001", "mice_col_lambda_reg_01", "mice_col_lambda_reg_1",
                  "mice_col_lambda_reg_10", "mice_col_lambda_reg_25")
mice_labels <- c("0.001", "0.01", "0.1", "1", "10", "25")

mice_scores <- subset(match_scores, Method %in% mice_methods)
mice_scores$Method <- factor(mice_scores$Method, levels=mice_methods)

mice_subset <- subset(mice_scores)
mice_col = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "D. MICE Posterior Prediction", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  scale_y_continuous(limits=c(min_score, 1.5)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_methods <- c("mice_pmm_X", "mice_pmm_lambda_reg_01", "mice_pmm_lambda_reg_1", "mice_pmm_lambda_reg_10",
                  "mice_pmm_lambda_reg_25")
mice_labels <- c("0.001", "0.01", "0.1", "1", "10", "25")

mice_scores <- subset(match_scores, Method %in% mice_methods)
mice_scores$Method <- factor(mice_scores$Method, levels=mice_methods)

mice_subset <- subset(mice_scores)
mice_pmm = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "E. MICE Probabilistic Moment Matching", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  scale_y_continuous(limits=c(min_score, 1.5)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_r_methods <-c("r_pmm", "r_norm", "r_norm.nob", "r_norm.boot", "r_norm.predict", "r_mean", "r_rf", "r_ri", "r_sample")
mice_r_labels <- c("PMM", "Norm", "NOB", "Boot", "Norm.Pred", "Mean", "RF", "RI", "Sample")

mice_scores <- subset(match_scores, Method %in% mice_r_methods)
mice_scores$Method <- factor(mice_scores$Method, levels=mice_r_methods)

mice_subset <- subset(mice_scores)
mice_r = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "F. MICE R Package", y="RMSE", x="Method") +
  scale_x_discrete(labels=mice_r_labels) + 
  scale_y_continuous(limits=c(min_score, 2)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/fig_4_supp.png", width = 8, height = 10, res = 300, units = "in")
print(grid.arrange(top="Comparison on realistic spike-in",
                   arrangeGrob(knn, svd, si, mice_col, mice_pmm, mice_r, nrow=3, ncol=2), nrow=1, ncol=1))
dev.off()

comp_methods <- c("knn_751", "svd_2", "si_16", "mice_col_lambda_reg_1", "mice_pmm_X", "r_norm.predict")
