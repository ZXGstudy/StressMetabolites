#3. Article Publication Bar Chart Drawing
rm(list=ls())
data<- read.xlsx("../database/data.xlsx", sheet="Sheet2", colNames = TRUE, check.names = FALSE)
data$Publication.Year <- factor(data$Publication.Year, 
                                levels = as.character(sort(unique(data$Publication.Year))))

p5 <- ggplot(data, aes(x = Publication.Year, y = num)) +
  geom_bar(stat = "identity", fill = "#A6CEE3", alpha = 0.8) +
  geom_text(aes(label = num), vjust = -0.5, size = 4, color = "black") +
  labs(
    title = "Publications by Year",
    x = "Publication Year",
    y = "Number of Publications"
  ) +
  theme_bw()+
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
    axis.text.y = element_text(size = 10),
    axis.title = element_text(size = 12, face = "bold"),
    panel.grid.major = element_line(color = "white", linewidth = 0.2),
    panel.grid.minor = element_blank(),
    panel.grid = element_blank()
  )

p5
ggsave("../database/A_result/publication_year.pdf", 
       plot = p5, 
       width = 18, 
       height = 5, 
       device = pdf)