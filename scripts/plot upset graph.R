####ZXG-SMART
####2026.05
#### Plot Upset figure
rm(list = ls())
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(ComplexUpset)
library(ggplot2)

df <- read_excel("../database/metabolites_by_tissue.xlsx")

# select main tissues/sample sources
main_tissues <- c("Brain","Blood","Feces","Gastrointestinal Tract","Liver","Urine")

long_df <- df %>%
  pivot_longer(
    cols = everything(),
    names_to = "Tissue",
    values_to = "Metabolite"
  ) %>%
  filter(
    !is.na(Metabolite),
    Metabolite != ""
  ) %>%
  mutate(
    Metabolite = str_trim(Metabolite),
    
    # Apart from the six main sources, all others are categorized as Other sources.
    Tissue = if_else(
      Tissue %in% main_tissues,
      Tissue,
      "Other sources"
    ),
    
    Tissue = factor(
      Tissue,
      levels = c(
        "Brain",
        "Blood",
        "Feces",
        "Gastrointestinal Tract",
        "Liver",
        "Urine",
        "Other sources"
      )
    )
  ) %>%
  distinct(Tissue, Metabolite)


upset_df <- long_df %>%
  mutate(value = 1) %>%
  pivot_wider(
    names_from = Tissue,
    values_from = value,
    values_fill = 0
  )


# UpSet Display order in the diagram
tissue_order <- c(
  "Brain",
  "Blood",
  "Feces",
  "Gastrointestinal Tract",
  "Liver",
  "Urine",
  "Other sources"
)

# Draw UpSet graph
p <- upset(
  upset_df,
  intersect = tissue_order,
  min_size = 1,
  n_intersections = 30,
  sort_intersections_by = "cardinality",
  sort_sets = FALSE,
  width_ratio = 0.22,
  
  matrix = intersection_matrix(
    geom = geom_point(size = 1.5),
    segment = geom_segment(linewidth = 0.4)
  ),
  
  base_annotations = list(
    "Intersection size" = intersection_size(
      counts = TRUE,
      text = list(size = 2.8)
    ) +
      ylab("Number of reported metabolites") +
      theme_classic(base_size = 12)
  ),
  
  set_sizes = upset_set_size(
    geom = geom_bar(width = 0.65)
  ) +
    ylab("Set size") +
    theme_classic(base_size = 12)
)

print(p)