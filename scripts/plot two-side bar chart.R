####ZXG-SMART
####2025.07
#### Drawing a two-sided bar chart [studies and metabolite entries]

rm(list=ls())
library(openxlsx)
library(ggplot2)
library(dplyr)

data <- read_xlsx("../database/data.xlsx", sheet="Sheet1.1")

# count the number of studies and metabolite entries for each host.
host_list <- unique(data$Host)
host_stats <- data.frame(
  Host = host_list,
  study_count = sapply(host_list, function(x) length(unique(data$PMID[data$Host == x]))),
  metabolite_entry_count = sapply(host_list, function(x) sum(data$Host == x))
)

# Sort by number of studies in descending order and select the top 5
host_stats <- host_stats[order(-host_stats$study_count), ]
host_stats_top5 <- head(host_stats, 4)

# Convert data format
host_stats_melt <- reshape2::melt(host_stats_top5, id.vars = "Host", 
                                  variable.name = "type", value.name = "count")
host_stats_melt$type <- factor(host_stats_melt$type,
                               levels = c("study_count", "metabolite_entry_count"),
                               labels = c("Number of Studies", "Number of Metabolite Entries"))

host_order <- host_stats_melt %>%
  filter(type == "Number of Studies") %>%
  arrange(desc(count)) %>%
  pull(Host)

host_order <- host_stats_melt %>%
  filter(type == "Number of Studies") %>%
  arrange(count) %>%
  pull(Host)


# Set the Hosts in descending order of "Number of Studies".
host_stats_melt$Host <- factor(host_stats_melt$Host, levels = host_order)

# Create a beautified two-sided bar chart
p <- ggplot(host_stats_melt, aes(x = Host, y = count, fill = type)) +
  geom_bar(stat = "identity", position = position_dodge(0.8), width = 0.7, 
           color = "white", linewidth = 0.3, alpha = 0.9) +
  scale_fill_manual(values = c("Number of Studies" = "#A6CEE3", "Number of Metabolite Entries" = "#B2DF8A")) +
  labs(
    title = "Number of Studies vs Metabolite Entries",
    x = "Host",
    y = "Count",
    fill = "Metric Type"
  ) +
  theme_bw(base_size = 12) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16, 
                              margin = margin(b = 15)),
    axis.text.x = element_text(angle = 0,size = 11, 
                               face = "bold", color = "black"),
    axis.text.y = element_text(size = 10, color = "black"),
    axis.title = element_text(face = "bold", size = 12),
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10)),
    legend.position = "top",
    legend.title = element_text(face = "bold", size = 11),
    legend.text = element_text(size = 10),
    panel.grid.major = element_line(color = "white", linewidth = 0.2),
    panel.grid.minor = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA),
    plot.margin = margin(20, 20, 20, 20)
  ) +
  geom_text(aes(label = count), 
            position = position_dodge(0.8), 
            vjust = 0.5, size = 3.5, fontface = "bold") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))+
  coord_flip()

print(p)

ggsave("../database/A_result/host_statistics_top4.pdf", 
       plot = p, 
       width = 6, 
       height = 6, 
       device = pdf)