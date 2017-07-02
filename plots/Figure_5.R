library(reshape2)
library(ggplot2)
library(gridExtra)
library(grid)

# match
methods <- c("r_sample", "r_mean", "simple_median", "knn_751", "svd_2", "si_s_8", "mice_col_lambda_reg_1",
             "mice_pmm_X", "r_norm.predict", "r_pmm", "r_rf", "r_norm")
labels <- c('Random Sample (R)', 'Mean (R)', 'Median (FI)', 'KNN (FI)', 'SVD (FI)', 'SoftImpute (FI)', 'MICE col (FI)',
            'MICE pmm (FI)', 'MICE norm.pred (R)', 'MICE pmm (R)', 'MICE RF (R)', 'MICE Norm (R)')

by_var <- read.csv('/data/imputation_scores/match_by_var.csv')
by_var$Method <- factor(by_var$Method, levels=methods)
by_var_subset <- subset(by_var, Method %in% methods)


loinc_codes <- c("2345.7", "718.7", "4544.3", "787.2", "786.4", "785.6",
                 "2160.0", "2823.3", "32623.1", "6690.2", "789.8",
                 "788.0", "3094.0", "777.3", "2951.2", "2075.0",
                 "2028.9", "17861.6", "1743.4", "30239.8", "10466.1",
                 "1975.2", "2885.2", "751.8", "2093.3", "2085.9",
                 "2571.8", "13457.7")
print(loinc_codes[1])

by_var_subset$Loinc_Codes <- with(by_var_subset, loinc_codes[Var_id-2])
by_var_subset$Loinc_Codes <-factor(by_var_subset$Loinc_Codes, levels=c("2345.7", "718.7", "4544.3", "787.2", "786.4", "785.6",
                                                                       "2160.0", "2823.3", "32623.1", "6690.2", "789.8",
                                                                       "788.0", "3094.0", "777.3", "2951.2", "2075.0",
                                                                       "2028.9", "17861.6", "1743.4", "30239.8", "10466.1",
                                                                       "1975.2", "2885.2", "751.8", "2093.3", "2085.9",
                                                                       "2571.8", "13457.7"))

print(dim(by_var_subset))
plot = ggplot(by_var_subset, aes(x=Method, y=MSE, color=Loinc_Codes)) + 
  stat_summary(fun.y = function(y){(y)}, geom = "point") +
  ggtitle("B. Root Mean Squared Error By Algorithm and Lab")+
  geom_hline(yintercept = sqrt(2))+
  theme_bw() +
  labs(color = "Lab Test (by LOINC code)") +
  ylab("RMSE")+
  scale_x_discrete(labels=labels) +
  theme(axis.text.x = element_text(angle=45, hjust = 1))

png("./figures/figure_5.png", width = 8, height = 5, res = 300, units = "in")
print(grid.arrange(arrangeGrob(plot), nrow=1, ncol=1))
dev.off()

# supplement 22
match_scores <- read.csv('/data/imputation_scores/match.csv')
print(dim(match_scores))

min_score = min(match_scores['MSE'])
max_score = max(match_scores['MSE'])

scores <- subset(match_scores, Method %in% methods)
scores$Method <- factor(scores$Method, levels=methods)

supp_plot = ggplot(scores, aes(x=Method, y=MSE)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A. Matching Patient Comparison", y="RMSE", x="Method") +
  scale_x_discrete(labels=labels) + 
  scale_y_continuous(limits=c(min_score, max_score)) +
  theme_bw() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))

png("./figures/Supplemental_Figure_23.png", width = 8, height = 5, res = 300, units = "in")
print(grid.arrange(arrangeGrob(supp_plot), nrow=1, ncol=1))
dev.off()

