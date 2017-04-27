library(reshape2)
library(ggplot2)
library(gridExtra)
#

#setwd('/home/brett/code/imputation/')
setwd('/Users/brett/code/imputation/')

# MCAR
mcar_scores <- read.csv('./output/imputation_scores/mcar.csv')
print(dim(mcar_scores))

#mcar_scores[,'MSE'] <- sqrt(mcar_scores[,'MSE'] * (1/mcar_scores[,'Percent.Missing']))
#mcar_scores[,'MSE'] <- sqrt(mcar_scores[,'MSE'])
#mcar_r_scores <- read.csv('./output/')


spikein <- c(0.1, 0.2, 0.3, 0.4, 0.5)

# First we Check all KNN across each percent missing
knn_methods <- c("knn_1", "knn_3", "knn_9", "knn_15", "knn_30", "knn_81", "knn_243", "knn_751", "knn_2000", "knn_6000")
#knn_labels <- c('KNN 1', 'KNN 3', 'KNN 9', 'KNN 15', 'KNN 30', 'KNN 81', 'KNN 243', 'KNN 751', 'KNN 2000', 'KNN 6000')
knn_labels <- c('1', '3', '9', '15', '30', '81', '243', '751', '2000', '6000')

knn_scores <- subset(mcar_scores, Method %in% knn_methods)
knn_scores$Method <- factor(knn_scores$Method, levels=knn_methods)

mcar_subset <- subset(knn_scores, Percent.Missing==0.1)
knn1 = ggplot(mcar_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Imputation Method") +
  scale_x_discrete(labels=knn_labels) + 
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, hjust = 1))

mcar_subset <- subset(knn_scores, Percent.Missing==0.2)
knn2 = ggplot(mcar_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. 0.2", y="RMSE", x="Imputation Method") +
  scale_x_discrete(labels=knn_labels) + 
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

mcar_subset <- subset(knn_scores, Percent.Missing==0.3)
knn3 = ggplot(mcar_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. 0.3", y="RMSE", x="Imputation Method") +
  scale_x_discrete(labels=knn_labels) + 
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
  labs(title = "E. 0.5", y="RMSE", x="Imputation Method") +
  scale_x_discrete(labels=knn_labels) + 
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/supp_knn.png", width = 7.5, height = 5, res = 300, units = "in")
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
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

svd_subset <- subset(svd_scores, Percent.Missing==0.2)
svd2 = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "B. 0.2", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

svd_subset <- subset(svd_scores, Percent.Missing==0.3)
svd3 = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "C. 0.3", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

svd_subset <- subset(svd_scores, Percent.Missing==0.4)
svd4 = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "D. 0.4", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

svd_subset <- subset(svd_scores, Percent.Missing==0.5)
svd5 = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "E. 0.5", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

png("./plots/supp_svd.png", width = 7.5, height = 5, res = 300, units = "in")
print(grid.arrange(top="SVD MCAR Spike-in",
                   arrangeGrob(svd1, svd2, svd3, svd4, svd5, nrow=2, ncol=3), nrow=1, ncol=1))
dev.off()

si_methods <- c("si_s_half", "si_s_1", "si_s_2", "si_s_4", "si_s_8", "si_s_16", "si_s_32", "si_s_64", "si_s_128")
si_labels <- c("0.5", "1", "2", "4", "8", "16", "32", "64", "128")

si_scores <- subset(mcar_scores, Method %in% si_methods)
svd_scores$Method <- factor(svd_scores$Method, levels=svd_methods)

si_subset <- subset(svd_scores, Percent.Missing==0.1)
svd1 = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

si_subset <- subset(svd_scores, Percent.Missing==0.1)
svd1 = ggplot(svd_subset, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. 0.1", y="RMSE", x="Rank") +
  scale_x_discrete(labels=svd_labels) + 
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))



# MCAR
mcar_scores<-read.csv('./output/imputation_scores/mcar.csv')
print(dim(mcar_scores))
print(list.df.var.types(mcar_scores))

mcar_scores <- mcar_scores[, !(names(mcar_scores) %in% "X")]

mcar_scores[,'MSE'] = as.numeric(mcar_scores[,'MSE'])
mcar_scores[,'Percent.Missing'] = as.numeric(mcar_scores[,'Percent.Missing'])
mcar_scores[,'Trial'] = as.numeric(mcar_scores[,'Trial'])
mcar_scores[,'Method'] = as.character(mcar_scores[,'Method'])

spikein <- c(0.1, 0.2, 0.3, 0.4, 0.5)

mcar_subset <- subset(mcar_scores, Percent.Missing==0.1)

ggplot(mcar_subset, , aes(x=Method, y=MSE)) +
  geom_boxplot() +
  labs(title = "A.", y="MSE", x="Method")

# MNAR
mnar_scores<-read.csv('./output/imputation_scores/mnar.csv')
print(dim(mnar_scores))

