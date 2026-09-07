####ZXG-SMART
####2026.05
#### Plotting heatmaps of the intersection of metabolites from two tissues

library(tidyverse)
library(ggplot2)
# 1. Read the metabolite table for each tissue column.
df <- read_excel("../database/metabolites_by_tissue.xlsx")

# 2. Specify the main tissue sources
tissue_use <- c(
  "Brain",
  "Blood",
  "Feces",
  "Gastrointestinal Tract",
  "Liver",
  "Urine"
)
tissue_use <- intersect(tissue_use, colnames(df))

# 3. Constructing a list: Each organization corresponds to a unique metadata vector.
met_list <- lapply(tissue_use, function(tissue) {
  df[[tissue]] %>%
    as.character() %>%
    str_squish() %>%
    na_if("") %>%
    na.omit() %>%
    unique() %>%
    sort()
})

names(met_list) <- tissue_use

# 4. Calculate pairwise inclusive overlap
overlap_mat <- matrix(
  0,
  nrow = length(tissue_use),
  ncol = length(tissue_use),
  dimnames = list(tissue_use, tissue_use)
)

for (i in tissue_use) {
  for (j in tissue_use) {
    overlap_mat[i, j] <- length(intersect(met_list[[i]], met_list[[j]]))
  }
}

# 5. View the matrix
print(overlap_mat)

# `overlap_mat` is the pairwise overlap matrix you calculated earlier.
overlap_mat_int <- round(overlap_mat)

overlap_df <- as.data.frame(overlap_mat_int) %>%
  rownames_to_column("Tissue_1") %>%
  pivot_longer(
    cols = -Tissue_1,
    names_to = "Tissue_2",
    values_to = "Overlap"
  )

tissue_order <- rownames(overlap_mat_int)

overlap_df <- overlap_df %>%
  mutate(
    Tissue_1 = factor(Tissue_1, levels = tissue_order),
    Tissue_2 = factor(Tissue_2, levels = tissue_order),
    row_id = as.numeric(Tissue_1),
    col_id = as.numeric(Tissue_2)
  ) %>%
  # Keep only one triangle: lower triangle + diagonal
  filter(row_id >= col_id)

# Plot
p <- ggplot(overlap_df, aes(x = Tissue_2, y = Tissue_1, fill = Overlap)) +
  geom_tile(color = "white", linewidth = 0.8) +
  geom_text(
    aes(label = Overlap),
    size = 4,
    color = "black"
  ) +
  scale_fill_gradient(
    low = "#F7FBFF",
    high = "#2B6CB0",
    name = "Shared\nmetabolites"
  ) +
  coord_fixed() +
  labs(
    title = "Pairwise overlap of stress-associated metabolites across tissues",
    x = NULL,
    y = NULL
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 14
    ),
    axis.text.x = element_text(
      angle = 45,
      hjust = 1,
      vjust = 1,
      color = "black",
      size = 11
    ),
    axis.text.y = element_text(
      color = "black",
      size = 11
    ),
    panel.grid = element_blank(),
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 9)
  )

print(p)