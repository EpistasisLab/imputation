library(reshape2)
library(ggplot2)
library(gridExtra)

#setwd('/home/brett/code/imputation/')
setwd('/Users/brett/code/imputation/')

panel_scores<-read.csv('./data/all_patients/all_panels.csv')
panel_scores<-panel_scores[-c(1)]

lead_labs<-c("751-8", "1743-4", "10466-1", "20565-8", "2708-6", "1925-7",
             "19994-3", "1990-1", "2157-6", "12187-1", "6303-2", "3181-5",
             "27811-9", "27818-4", "27822-6", "13982-4", "2064-4", "3167-4",
             "2888-6", "28009-9", "2132-9", "2284-8", "2965-2", "18262-6",
             "2857-1", "30934-4", "33762-6", "10535-3", "3026-2", "1834-1",
             "21198-7", "3024-7", "3051-0", "11572-5", "29958-6", "13964-2",
             "13965-9", "30522-7", "1763-2", "2143-6", "5206-8", "20448-7",
             "11580-8", "2742-5", "1986-9", "1798-8", "20563-3", "17862-4",
             "1825-9", "10330-9", "23860-0", "2340-8", "3255-7", "17849-1",
             "1988-5", "10886-0", "20437-0", "13967-5", "2986-8", "2991-8",
             "10501-5", "20433-9", "2243-4", "2571-8", "14957-5", "17856-6",
             "27353-2", "72586-1", "2465-3", "2458-8", "763-3", "740-1",
             "2731-8", "2276-4", "2502-3", "53115-2", "10334-1", "2039-6",
             "1968-7", "14338-8", "19123-9", "2324-2", "2777-1", "12180-6",
             "14804-9", "3084-1")
colnames(panel_scores)<-lead_labs

scores<-melt(panel_scores)
print(scores)
colnames(scores)<-c("Labs", "ROC_AUC")

ggplot(scores, aes(x=reorder(Labs, -ROC_AUC), y=ROC_AUC, color=Labs)) +
  geom_boxplot(outlier.colour="black", outlier.shape=1, outlier.size=1) + 
  labs(title="A.", y="ROC AUC", x="Labs") +
  theme(legend.position="none", 
        axis.text.x = element_text(angle = 90, hjust = 1))