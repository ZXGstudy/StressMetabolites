####ZXG-SMART
####2026.05
####Volcano Plot Visualization (Grouped by Host) ####
library(ggplot2)
library(dplyr)
library(ggrepel)

# Ensure vote_counts contains the necessary columns and generate log10_p and direction.
vote_counts <- vote_counts %>%
  mutate(
    log10_p = -log10(p_value),
    direction = case_when(
      direction_consistent == "Significant Up" ~ "Up",
      direction_consistent == "Significant Down" ~ "Down",
      TRUE ~ "Non-significant"
    )
  )

# Define color scheme
volcano_colors <- c("Up" = "#D73027", "Down" = "#1A9850", "Non-significant" = "grey70")

# Unified plotting functions (by Host)
plot_volcano <- function(df, host_name) {
  df_sub <- df %>% filter(Host == host_name)
  ggplot(df_sub, aes(x = n_up - n_down, y = log10_p, color = direction)) +
    geom_point(position = position_jitter(width = 0.2, height = 0), 
               alpha = 0.8, size = 2.5) +
    scale_color_manual(values = volcano_colors) +
    geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "black") +
    geom_vline(xintercept = 0, linetype = "dashed", color = "black") +
    ggrepel::geom_text_repel(
      data = df_sub %>% filter(p_value < 0.05),
      aes(label = Metabolite),
      size = 4,
      angle = 0,
      box.padding = 0.5,
      point.padding = 0.2,
      segment.color = "gray40",
      segment.size = 0.3,
      segment.curvature = 0.2,
      nudge_x = 0.3,
      max.overlaps = Inf
    ) +
    theme_bw(base_size = 14) +
    theme(
      legend.position = "top",
      legend.box = "horizontal",
      legend.spacing = unit(0.5, "cm"),
      legend.key.height = unit(0.4, "cm"),
      legend.key.width = unit(0.4, "cm"),
      panel.grid.major = element_line(color = "white", linewidth = 0.3),
      panel.grid.minor = element_blank(),
      axis.line = element_line(color = "black", linewidth = 0.5),
      axis.ticks = element_line(color = "black", linewidth = 0.5),
      axis.text = element_text(color = "black", size = 15),
      axis.title = element_text(face = "bold", size = 15),
      plot.title = element_text(face = "bold", size = 15, hjust = 0.5),
      plot.subtitle = element_text(size = 14, hjust = 0.5, color = "gray40"),
      legend.title = element_text(face = "bold", size = 10),
      legend.text = element_text(size = 9)
    ) +
    labs(
      title = paste("Volcano Plot -", host_name),
      x = "Vote counting statistic (n_up - n_down)",
      y = expression(-log[10](p~value)),
      color = "Direction"
    )
}

# Loop through and draw the volcano graph for each host and save it.
unique_hosts <- unique(vote_counts$Host)

for (h in unique_hosts) {
  p <- plot_volcano(vote_counts, h)
  print(p)
  
  ggsave(
    filename = paste0("../database/A_result/0624Volcano_", h, ".pdf"),
    plot = p,
    width = 5,
    height = 5,
    dpi = 300
  )
}

# Statistical Summary (by Host)
summary_stats <- vote_counts %>%
  group_by(Host) %>%
  dplyr::summarise(
    Total_Metabolites = n(),
    Significant = sum(p_value < 0.05),
    Percent_Significant = round(Significant / Total_Metabolites * 100, 1),
    Up_Regulated = sum(p_value < 0.05 & direction == "Up"),
    Down_Regulated = sum(p_value < 0.05 & direction == "Down")
  )

print(summary_stats)
