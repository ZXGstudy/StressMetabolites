####ZXG-SMART
####2026.05
####Volcano Plot Visualization (Grouped by Sample source) ####
library(ggplot2)
library(dplyr)
library(ggrepel)

vote_counts <- vote_counts %>%
  mutate(
    log10_p = -log10(p_value),
    direction = case_when(
      direction_consistent == "Significant Up" ~ "Up",
      direction_consistent == "Significant Down" ~ "Down",
      TRUE ~ "Non-significant"
    )
  )

volcano_colors <- c("Up" = "#df5e4c", "Down" = "#5fb9cf", "Non-significant" = "grey70")

plot_volcano <- function(df, sample_type_name) {
  df_sub <- df %>% filter(Sample_type == sample_type_name)
  
  ggplot(df_sub, aes(x = n_up - n_down, y = log10_p, color = direction)) +
    geom_point(position = position_jitter(width = 0.2, height = 0), alpha = 0.8, size = 2.5)+
    scale_color_manual(values = volcano_colors) +
    geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "black") +
    geom_vline(xintercept = 0, linetype = "dashed",color = "black") +
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
    )+
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
      title = paste("Volcano Plot -", sample_type_name),
      x = "Vote counting statistic",
      y = expression(-log[10](p~value)),
      color = "Direction"
    )
}


unique_samples <- unique(vote_counts$Sample_type)

for (s in unique_samples) {
  p <- plot_volcano(vote_counts, s)
  print(p)
  ggsave(
    filename = paste0("../database/A_result/0624Volcano_", s, ".pdf"),
    plot = p,
    width = 5,
    height = 5,
    dpi = 300
  )
}

