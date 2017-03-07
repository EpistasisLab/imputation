# MCAR
mcar_scores<-read.csv('./data/prediction_scores/mcar.csv')
print(dim(mcar_scores))

mcar_scores <- mcar_scores[, !(names(mcar_scores) %in% "X")]
colnames(mcar_scores) <- c("10%", "20%", "30%", "40%", "50%")
mcar_df <- melt(mcar_scores)
colnames(mcar_df) <- c("Spikein", "ROC_AUC")

twoA <- ggplot(mcar_df, aes(x=Spikein, y=ROC_AUC, color=Spikein)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title = "A.", y="ROC AUC", x="Spike-in Percentage")

# MAR
mar_scores<-read.csv('./data/prediction_scores/mar.csv')
print(dim(mar_scores))

mar_scores <- mar_scores[, !(names(mar_scores) %in% "X")]
colnames(mar_scores) <- c("1", "2", "3", "4")
mar_df <- melt(mar_scores)
colnames(mar_df) <- c("Quartile", "ROC_AUC")

twoB <- ggplot(mar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) +
  labs(title="B.", y="ROC AUC", x="Quartile")

# MNAR
mnar_scores<-read.csv('./data/prediction_scores/mnar.csv')
print(dim(mnar_scores))

mnar_scores <- mnar_scores[, !(names(mnar_scores) %in% "X")]
colnames(mnar_scores) <- c("1", "2", "3", "4")
mnar_df <- melt(mnar_scores)
colnames(mnar_df) <- c("Quartile", "ROC_AUC")

twoC <- ggplot(mnar_df, aes(x=Quartile, y=ROC_AUC, color=Quartile)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) + 
  labs(title="C.", y="ROC AUC", x="Quartile")

# all labs
all_lab_names <- c("10330-9", "10334-1", "10466-1", "10501-5", "10535-3", "10886-0", "11572-5",
                   "11580-8", "12180-6", "12187-1", "12841-3", "13457-7", "13964-2", "13965-9", "13967-5",
                   "13969-1", "13982-4", "14338-8", "14804-9", "14957-5", "14959-1", "1743-4", "1763-2", "17820-2",
                   "17849-1", "17856-6", "17861-6", "17862-4", "1798-8", "1825-9", "18262-6", "1834-1", "19123-9",
                   "1922-4", "1925-7", "1960-4", "1968-7", "1975-2", "1986-9", "1988-5", "1989-3", "1990-1",
                   "19994-3", "2019-8", "2028-9", "2039-6", "20433-9", "20436-2", "20437-0", "20438-8", "20448-7",
                   "20563-3", "20565-8", "2064-4", "2069-3", "2075-0", "2085-9", "2093-3", "21198-7", "2132-9",
                   "2143-6", "2157-6", "2160-0", "2236-8", "2243-4", "2276-4", "2284-8", "2324-2", "2339-0",
                   "2340-8", "2345-7", "23860-0", "2458-8", "2465-3", "2472-9", "2498-4", "2501-5", "2502-3",
                   "2571-8", "2614-6", "26498-6", "2703-7", "2708-6", "2714-4", "2731-8", "27353-2", "2742-5",
                   "2744-1", "2777-1", "27811-9", "27818-4", "27822-6", "28009-9", "2823-3", "2839-9", "2857-1",
                   "2885-2", "2888-6", "2889-4","2951-2", "2965-2", "2986-8", "2990-0", "2991-8", "29958-6",
                   "30239-8", "3024-7", "3026-2", "3040-3", "3051-0", "30522-7", "3084-1", "30934-4", "3094-0",
                   "3167-4", "3181-5", "3182-3", "3255-7", "32623-1", "33762-6", "38483-4", "4544-3", "5206-8",
                   "53115-2", "6303-2", "6690-2", "71695-1", "718-7", "72582-0", "72586-1", "72598-6", "739-3",
                   "740-1", "748-4", "751-8", "763-3", "764-1", "777-3", "785-6", "786-4", "787-2", "788-0", "789-8")
scores<-read.csv("./data/prediction_scores/real_all_labs.csv")
print(dim(scores))
drops <- "X"
scores = scores[ , !(colnames(scores) %in% drops)]
colnames(scores) <- all_lab_names
scores_df <- melt(scores)

colnames(scores_df) <- c("Labs", "ROC_AUC")
twoD = ggplot(scores_df, aes(x=Labs, y=ROC_AUC, color=Labs)) +
  labs(title="D.") +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) + 
  theme(legend.position="none",
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

scores_df_group <- scores_df
scores_df_group$Labs = 1
twoE = ggplot(scores_df_group, aes(x=Labs, y=ROC_AUC)) +
  geom_violin() + 
  labs(title="E.", y="ROC AUC") +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# top 29
loinc <- c("718-7", "4544-3", "787-2", "786-4", "785-6", "6690-2", "789-8", "788-0", "32623-1", "777-3",
           "2345-7", "2160-0", "2823-3", "3094-0", "2951-2", "2075-0", "2028-9", "17861-6", "1743-4",
           "30239-8", "1975-2", "2885-2", "10466-1", "751-8", "2093-3", "2571-8", "2085-9", "13457-7",
           "2965-2")
select_scores<-scores[, loinc]
print(dim(select_scores))

colnames(select_scores) = loinc
select_scores <- select_scores[, !(names(select_scores) %in% "X")]
select_scores_df <- melt(select_scores)
colnames(select_scores_df) <- c("Lab", "ROC_AUC")

twoF = ggplot(select_scores_df, aes(x=Lab, y=ROC_AUC, color=Lab)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) + 
  labs(title="F.", y="ROC AUC", x="Labs") +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))

s_scores_df <- select_scores_df
s_scores_df$Lab = 1
twoG = ggplot(s_scores_df, aes(x=Lab, y=ROC_AUC)) +
  geom_violin() + 
  labs(title="G.", y="ROC AUC") + 
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# figure 2 grid
library(gridExtra)
png("./plots/figure_2.png", width = 10, height = 10, res = 300, units = "in")
print(grid.arrange(arrangeGrob(twoA, twoB, twoC, ncol=3), 
                   arrangeGrob(twoD, twoE, ncol=2),
                   arrangeGrob(twoF, twoG, ncol=2), nrow=3, ncol=1))
dev.off()
