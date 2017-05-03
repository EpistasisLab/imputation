library(reshape2)
library(ggplot2)
library(gridExtra)

#setwd('/home/brett/code/imputation/')
setwd('/Users/brett/code/imputation/')

# MCAR
mcar_scores <- read.csv('./output/imputation_scores/mcar.csv')
print(dim(mcar_scores))

spikein <- c(0.1, 0.2, 0.3, 0.4, 0.5)

# First we Check all KNN across each percent missing
knn_methods <- c("knn_1", "knn_3", "knn_9", "knn_15", "knn_30", "knn_81", "knn_243", "knn_751", "knn_2000", "knn_6000")
#knn_labels <- c('KNN 1', 'KNN 3', 'KNN 9', 'KNN 15', 'KNN 30', 'KNN 81', 'KNN 243', 'KNN 751', 'KNN 2000', 'KNN 6000')
knn_labels <- c('1', '3', '9', '15', '30', '81', '243', '751', '2000', '6000')

knn_scores <- subset(mcar_scores, Method %in% knn_methods)
knn_scores$Method <- factor(knn_scores$Method, levels=knn_methods)

min_score = min(mcar_scores['MSE'])
max_score = max(mcar_scores['MSE'])

mcar_subset <- subset(knn_scores, Percent.Missing==0.1)
knn1 = ggplot(mcar_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Imputation Method") +
  scale_x_discrete(labels=knn_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, hjust = 1))

mcar_subset <- subset(knn_scores, Percent.Missing==0.2)
knn2 = ggplot(mcar_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. 0.2", y="RMSE", x="Imputation Method") +
  scale_x_discrete(labels=knn_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mcar_subset <- subset(knn_scores, Percent.Missing==0.3)
knn3 = ggplot(mcar_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. 0.3", y="RMSE", x="Imputation Method") +
  scale_x_discrete(labels=knn_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mcar_subset <- subset(knn_scores, Percent.Missing==0.4)
knn4 = ggplot(mcar_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "D. 0.4", y="RMSE", x="Imputation Method") +
  scale_x_discrete(labels=knn_labels) + 
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mcar_subset <- subset(knn_scores, Percent.Missing==0.5)
knn5 = ggplot(mcar_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "E. 0.5", y="RMSE", x="K neighbors") +
  scale_x_discrete(labels=knn_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/supp_mcar_knn.png", width = 7.5, height = 5, res = 300, units = "in")
print(grid.arrange(top="KNN MCAR Spike-in",
                   arrangeGrob(knn1, knn2, knn3, knn4, knn5, nrow=2, ncol=3), nrow=1, ncol=1))
dev.off()

svd_methods <- c("svd_1", "svd_2", "svd_3", "svd_4", "svd_5", "svd_6", "svd_7", "svd_8", "svd_9", "svd_10", 
                 "svd_11", "svd_12", "svd_13", "svd_14", "svd_15", "svd_16", "svd_17", "svd_18", "svd_19", "svd_20",
                 "svd_21", "svd_22", "svd_23", "svd_24")
svd_labels <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18",
                "19", "20", "21", "22", "23", "24")

svd_scores <- subset(mcar_scores, Method %in% svd_methods)
svd_scores$Method <- factor(svd_scores$Method, levels=svd_methods)

svd_subset <- subset(svd_scores, Percent.Missing==0.1)
svd1 = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

svd_subset <- subset(svd_scores, Percent.Missing==0.2)
svd2 = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. 0.2", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

svd_subset <- subset(svd_scores, Percent.Missing==0.3)
svd3 = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. 0.3", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

svd_subset <- subset(svd_scores, Percent.Missing==0.4)
svd4 = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

svd_subset <- subset(svd_scores, Percent.Missing==0.5)
svd5 = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/supp_mcar_svd.png", width = 7.5, height = 5, res = 300, units = "in")
print(grid.arrange(top="SVD MCAR Spike-in",
                   arrangeGrob(svd1, svd2, svd3, svd4, svd5, nrow=2, ncol=3), nrow=1, ncol=1))
dev.off()

si_methods <- c("si_s_half", "si_s_1", "si_s_2", "si_s_4", "si_s_8", "si_s_16", "si_s_32", "si_s_64", "si_s_128")
si_labels <- c("0.5", "1", "2", "4", "8", "16", "32", "64", "128")

si_scores <- subset(mcar_scores, Method %in% si_methods)
si_scores$Method <- factor(si_scores$Method, levels=si_methods)

si_subset <- subset(si_scores, Percent.Missing==0.1)
si1 = ggplot(si_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Rank") +
  scale_x_discrete(labels=si_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

si_subset <- subset(si_scores, Percent.Missing==0.2)
si2 = ggplot(si_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. 0.2", y="RMSE", x="Rank") +
  scale_x_discrete(labels=si_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

si_subset <- subset(si_scores, Percent.Missing==0.3)
si3 = ggplot(si_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. 0.3", y="RMSE", x="Rank") +
  scale_x_discrete(labels=si_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

si_subset <- subset(si_scores, Percent.Missing==0.4)
si4 = ggplot(si_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "D. 0.4", y="RMSE", x="Rank") +
  scale_x_discrete(labels=si_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

si_subset <- subset(si_scores, Percent.Missing==0.5)
si5 = ggplot(si_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "E. 0.5", y="RMSE", x="Rank") +
  scale_x_discrete(labels=si_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/supp_mcar_si.png", width = 7.5, height = 5, res = 300, units = "in")
print(grid.arrange(top="SoftImpute MCAR Spike-in",
                   arrangeGrob(si1, si2, si3, si4, si5, nrow=2, ncol=3), nrow=1, ncol=1))
dev.off()

mice_methods <- c("MICE", "mice_col_lambda_reg_001", "mice_col_lambda_reg_01", "mice_col_lambda_reg_1",
                  "mice_col_lambda_reg_10", "mice_col_lambda_reg_25")
mice_labels <- c("0.001", "0.01", "0.1", "1", "10", "25")

mice_scores <- subset(mcar_scores, Method %in% mice_methods)
mice_scores$Method <- factor(mice_scores$Method, levels=mice_methods)

mice_subset <- subset(mice_scores, Percent.Missing==0.1)
mice1 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.2)
mice2 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. 0.2", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.3)
mice3 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. 0.3", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.4)
mice4 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "D. 0.4", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.5)
mice5 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "E. 0.5", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/supp_mcar_mice_col.png", width = 7.5, height = 5, res = 300, units = "in")
print(grid.arrange(top="MICE Posterior Prediction MCAR Spike-in",
                   arrangeGrob(mice1, mice2, mice3, mice4, mice5, nrow=2, ncol=3), nrow=1, ncol=1))
dev.off()

mice_methods <- c("mice_pmm_X", "mice_pmm_lambda_reg_001", "mice_pmm_lambda_reg_01", "mice_pmm_lambda_reg_1",
                  "mice_pmm_lambda_reg_10", "mice_pmm_lambda_reg_25")
mice_labels <- c("0.001", "0.01", "0.1", "1", "10", "25")

mice_scores <- subset(mcar_scores, Method %in% mice_methods)
mice_scores$Method <- factor(mice_scores$Method, levels=mice_methods)

mice_subset <- subset(mice_scores, Percent.Missing==0.1)
mice1 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.2)
mice2 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. 0.2", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.3)
mice3 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. 0.3", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.4)
mice4 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "D. 0.4", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.5)
mice5 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "E. 0.5", y="RMSE", x="Lambda") +
  scale_x_discrete(labels=mice_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/supp_mcar_mice_pmm.png", width = 7.5, height = 5, res = 300, units = "in")
print(grid.arrange(top="MICE Probabilistic Moment Matching MCAR Spike-in",
                   arrangeGrob(mice1, mice2, mice3, mice4, mice5, nrow=2, ncol=3), nrow=1, ncol=1))
dev.off()

# MICE R 
mice_r_methods <-c("r_pmm", "r_norm", "r_norm.nob", "r_norm.boot", "r_norm.predict", "r_mean", "r_rf", "r_ri", "r_sample")
mice_r_labels <- c("PMM", "Norm", "NOB", "Boot", "Norm.Predict", "Mean", "RF", "RI", "Sample")

mice_scores <- subset(mcar_scores, Method %in% mice_r_methods)
mice_scores$Method <- factor(mice_scores$Method, levels=mice_r_methods)

mice_subset <- subset(mice_scores, Percent.Missing==0.1)
mice1 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Method") +
  scale_x_discrete(labels=mice_r_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.2)
mice2 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. 0.2", y="RMSE", x="Method") +
  scale_x_discrete(labels=mice_r_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.3)
mice3 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. 0.3", y="RMSE", x="Method") +
  scale_x_discrete(labels=mice_r_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.4)
mice4 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "D. 0.4", y="RMSE", x="Method") +
  scale_x_discrete(labels=mice_r_labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mice_subset <- subset(mice_scores, Percent.Missing==0.5)
mice5 = ggplot(mice_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "E. 0.5", y="RMSE", x="Method") +
  scale_x_discrete(labels=mice_r_labels) +
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/supp_mcar_mice_r.png", width = 7.5, height = 5, res = 300, units = "in")
print(grid.arrange(top="MICE R Package MCAR Spike-in",
                   arrangeGrob(mice1, mice2, mice3, mice4, mice5, nrow=2, ncol=3), nrow=1, ncol=1))
dev.off()




