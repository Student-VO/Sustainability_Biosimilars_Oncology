library(ggplot2)
library(dplyr)
library(grid)

data <- data.frame(
  Drug = c("Herceptin", "Kanjinti", "Ogivri", "Trazimera", "Herzuma", "Ontruzant",
           "Avastin", "Mvasi", "Zirabev", "Alymsys", "Vegzelma"),
  WAC = c(4363, 3697, 3696, 3402, 3927, 3709, 3188, 2710, 2454, 2874, 2710),
  ASP = c(3188, 310, 1611, 432, 1438, 1380, 2795, 801, 637, 2200, 2673),
  Change = c("", "-15%", "-15%", "-22%", "-10%", "-15%", "", "-15%", "-23%", "-10%", "-15%"))

# Filter data for Herceptin and its biosimilars
herceptin_data <- data %>% filter(Drug %in% c("Herceptin", "Kanjinti", "Ogivri", "Trazimera", "Herzuma", "Ontruzant"))

# Filter data for Avastin and its biosimilars
avastin_data <- data %>% filter(Drug %in% c("Avastin", "Mvasi", "Zirabev", "Alymsys", "Vegzelma"))

# Plot for Herceptin and its biosimilars
herceptin_plot <- ggplot(herceptin_data, aes(x = factor(Drug, levels = c("Herceptin", "Kanjinti", "Ogivri", "Trazimera", "Herzuma", "Ontruzant")))) +
  geom_bar(aes(y = WAC, fill = "WAC Price"), stat = "identity", width = 0.4) +
  geom_bar(aes(y = ASP, fill = "ASP Price"), stat = "identity", width = 0.2) +
  # WAC price labels inside the light blue bars
  geom_text(aes(y = WAC - 200, label = paste0("$", WAC)), color = "black", size = 3, fontface = "bold") +
  # ASP price labels
  geom_text(aes(y = ASP, label = paste0("$", ASP)), vjust = 1.5, color = "black", size = 3, fontface = "bold") +
  # Percentage labels for biosimilars
  geom_text(data = herceptin_data %>% filter(Drug != "Herceptin"),
            aes(y = 4363, label = Change), vjust = -0.5, color = "blue", size = 3, fontface = "bold") +
  # Arrows only for biosimilars
  geom_segment(data = herceptin_data %>% filter(Drug != "Herceptin"),
               aes(xend = Drug, y = 4363, yend = WAC), 
               arrow = arrow(length = unit(0.2, "cm")), color = "blue", size = 1.0) +
  labs(title = "Herceptin/Trastuzumab & Its Biosimilars (420mg), Q1 2024", y = "Price (USD)", x = "", fill = "Price Type") +
  scale_fill_manual(values = c("WAC Price" = "lightblue", "ASP Price" = "orange")) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, face = "bold"), # Bold x-axis labels
    axis.text.y = element_text(face = "bold"),
    legend.text = element_text(face = "bold"),                       # Bold legend labels
    legend.title = element_text(face = "bold")                       # Bold legend title
  )

# Plot for Avastin and its biosimilars
avastin_plot <- ggplot(avastin_data, aes(x = factor(Drug, levels = c("Avastin", "Mvasi", "Zirabev", "Alymsys", "Vegzelma")))) +
  geom_bar(aes(y = WAC, fill = "WAC Price"), stat = "identity", width = 0.4) +
  geom_bar(aes(y = ASP, fill = "ASP Price"), stat = "identity", width = 0.2) +
  # WAC price labels inside the light blue bars
  geom_text(aes(y = ifelse(Drug == "Vegzelma", WAC + 100, WAC - 100), 
                label = paste0("$", WAC)), 
            color = "black", size = 3, fontface = "bold") +
  # ASP price labels
  geom_text(aes(y = ASP, label = paste0("$", ASP)), vjust = 1.5, color = "black", size = 3, fontface = "bold") +
  # Percentage labels for biosimilars
  geom_text(data = avastin_data %>% filter(Drug != "Avastin"),
            aes(y = 3188, label = Change), vjust = -0.5, color = "blue", size = 3, fontface = "bold") +
  # Arrows only for biosimilars
  geom_segment(data = avastin_data %>% filter(Drug != "Avastin"),
               aes(xend = Drug, y = 3188, yend = WAC), 
               arrow = arrow(length = unit(0.2, "cm")), color = "blue", size = 1.0) +
  labs(title = "Avastin/Bevacizumab & Its Biosimilars (400mg), Q1 2024", y = "Price (USD)", x = "", fill = "Price Type") +
  scale_fill_manual(values = c("WAC Price" = "lightblue", "ASP Price" = "orange")) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, face = "bold"),# Bold x-axis labels
    axis.text.y = element_text(face = "bold"),                         
    legend.text = element_text(face = "bold"),                       # Bold legend labels
    legend.title = element_text(face = "bold"),                       # Bold legend title
    
  )

# Display the plots
herceptin_plot
avastin_plot