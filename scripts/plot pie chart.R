####ZXG-SMART
####2025.07
#### 1. Pie chart ploting----------
rm(list=ls())
library(openxlsx)
library(ggplot2)
library(ggsci)

df <- read.xlsx("../database/data.xlsx", sheet="3.2_June", colNames = TRUE, check.names = FALSE)
category_df <- as.data.frame(table(df[,2]))
colnames(category_df) <- c("category", "count")

# Merge categories with a count less than 50 into "Other"
category_df$category_orig <- category_df$category 
category_df$category <- ifelse(category_df$count < 50, "Other", as.character(category_df$category))
data <- aggregate(count ~ category, data = category_df, sum)

# Sort by count in descending order
data <- data[order(-data$count), ]

# Calculate percentages and labels
data$fraction <- data$count / sum(data$count)
data$percentage <- round(data$fraction * 100, 1)
data$label <- paste0(data$percentage, "%")

data$ymax <- cumsum(data$fraction)
data$ymin <- c(0, head(data$ymax, n=-1))
data$labelPosition <- (data$ymax + data$ymin) / 2
data$legend_label <- paste0(data$category, " (", data$count, ", ", data$percentage, "%)")

# Ensure the Other category is last
if("Other" %in% data$category) {
  other_row <- data[data$category == "Other", ]
  data <- data[data$category != "Other", ]
  data <- rbind(data, other_row)
}

data$ymax <- cumsum(data$fraction)
data$ymin <- c(0, head(data$ymax, n=-1))
data$labelPosition <- (data$ymax + data$ymin) / 2

# Create a donut chart (do not display scale labels, legend sorted by size)
p1 <- ggplot(data, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = reorder(legend_label, -count))) +
  geom_rect(color = "white", size = 0.5, alpha = 0.9) +
  scale_fill_npg(
    name = "Host Categories",
    guide = guide_legend(
      reverse = FALSE,
      keyheight = unit(0.8, "cm"),
      keywidth = unit(0.8, "cm")
    )
  ) +
  coord_polar(theta = "y") +
  xlim(c(2, 4.5)) +
  theme_void() +
  theme(
    legend.position = "right",
    legend.title = element_text(face = "bold", size = 12),
    legend.text = element_text(size = 10),
    legend.key.size = unit(0.8, "cm"),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    legend.box.margin = margin(0, 0, 0, 10)  
  ) +
  labs(
    title = "Host Species Distribution",
    fill = "Host Categories"
  )
print(p1)

ggsave("../database/A_result/pie-host.pdf", 
       plot = p1, 
       width = 7, 
       height = 7, 
       device = pdf)
