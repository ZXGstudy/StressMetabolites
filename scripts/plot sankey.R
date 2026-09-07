####ZXG-SMART
####2025.07
#### 1. Sankey图绘制----------
library(networkD3)
library(dplyr)
library(openxlsx)
library(xlsx)
library(readxl)

# 1. Data import
rm(list=ls())
df <- read_excel("../database/data.xlsx", sheet = "3.2")

# Host selection (according to reviewers' requirements)
df <- df[df$Host=="Human",]

# The first layer: Host -> Stress_Type
links1 <- df %>%
  group_by(Host, Stress_type) %>%
  tally(name = "value") %>%
  dplyr::rename(source = Host, target = Stress_type)

# The second layer: Stress_Type -> Stress_Model
links2 <- df %>%
  group_by(Stress_type, Stress_model_match) %>%
  tally(name = "value") %>%
  dplyr::rename(source = Stress_type, target = Stress_model_match)

# The Third layer:: Stress_Model -> Platform
links3 <- df %>%
  group_by(Stress_model_match, Sample_type) %>%
  tally(name = "value") %>%
  dplyr::rename(source = Stress_model_match, target = Sample_type)

# The fourth layer: Platform -> Sample_Type
links4 <- df %>%
  group_by(Sample_type, Metabolite) %>%
  tally(name = "value") %>%
  dplyr::rename(source = Sample_type, target = Metabolite)

# The fifth layer:: Platform -> Sample_Type
links5 <- df %>%
  group_by(Metabolite, Up_or_Down) %>%
  tally(name = "value") %>%
  dplyr::rename(source = Metabolite, target = Up_or_Down)

# Merge all layers
links <- bind_rows(links1,links2,links3,links4,links5)


# 2. Create nodes
nodes <- data.frame(name = unique(c(links$source, links$target)))


# 3. Convert the names in the connection to node indexes.
links$IDsource <- match(links$source, nodes$name) - 1
links$IDtarget <- match(links$target, nodes$name) - 1

cat("节点总数:", nrow(nodes), "\n")
cat("连接总数:", nrow(links), "\n")

# 检查各层节点分布
table(nodes$group)

# 4. Create Sankey fig
p <- sankeyNetwork(
  Links = links,      # 连接数据框
  Nodes = nodes,      # 节点数据框
  Source = "IDsource", # 源节点ID
  Target = "IDtarget", # 目标节点ID
  Value = "value",     # 连接的值（宽度）
  NodeID = "name",     # 节点显示的名称
  sinksRight = FALSE,  # 节点不对齐到右侧，让布局更自然
  fontSize = 14,       # 字体大小
  nodeWidth = 20,      # 节点宽度
  height = 800,        # 图形高度
  width = 1300         # 图形宽度
)

p
library(htmlwidgets)
library(webshot2)
saveWidget(p, file="../database/A_result/sankeyBasic3.1.html")
