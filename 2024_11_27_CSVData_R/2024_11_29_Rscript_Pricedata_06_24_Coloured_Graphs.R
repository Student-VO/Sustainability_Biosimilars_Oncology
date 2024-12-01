# Define a custom color palette for Bevacizumab and its biosimilars
bev_colors <- c(
  "Bevacizumab" = "#1f78b4",  # Blue
  "Mvasi" = "#33a02c",        # Green
  "Zirabev" = "#e31a1c",      # Red
  "Alymsys" = "#ff7f00"       # Orange
)

# Plot for Bevacizumab and its biosimilars with custom colors
ggplot(filtered_drugs, aes(x = Quarter_label, y = Price, group = Drug, color = Drug)) + 
  geom_line(aes(size = Line_Width)) +  # Only lines, no points
  scale_color_manual(values = bev_colors) +  # Use custom colors
  labs(
    title = "Trend of Drug Prices for Bevacizumab and its Biosimilars Over the Years",
    x = "Year & Quarter", 
    y = "Payment Limit (USD)"
  ) + 
  theme_minimal() + 
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, size = 10),
    axis.text.y = element_text(size = 10),
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    plot.caption = element_text(size = 8)
  ) + 
  scale_x_discrete(
    limits = unique(filtered_drugs$Quarter_label),  # Ensure all quarters are shown
    breaks = unique(filtered_drugs$Quarter_label),  # Set breaks to all available quarters
    labels = unique(filtered_drugs$Quarter_label)  # Apply the custom formatted labels
  ) + 
  scale_y_continuous(
    labels = scales::dollar_format(prefix = "$"), 
    limits = c(0, max(filtered_drugs$Price, na.rm = TRUE) + 10),  # Adjust Y-axis range
    breaks = seq(0, max(filtered_drugs$Price, na.rm = TRUE) + 10, by = 10)  # Customize Y-axis breaks
  ) + 
  scale_size_identity() +  # Use the custom line thickness mapping
  theme(aspect.ratio = 2/3)  # Set the aspect ratio to 3:2

# Define a custom color palette for Trastuzumab and its biosimilars
trast_colors <- c(
  "Trastuzumab" = "#6a3d9a",  # Purple
  "Ogivri" = "#b15928",       # Brown
  "Ontruzant" = "#a6cee3",    # Light Blue
  "Herzuma" = "#b2df8a",      # Light Green
  "Trazimera" = "#fb9a99"     # Pink
)

# Plot for Trastuzumab and its biosimilars with custom colors
ggplot(filtered_trastuzumab, aes(x = Quarter_label, y = Price, group = Drug, color = Drug)) + 
  geom_line(aes(size = Line_Width)) +  # Only lines, no points
  scale_color_manual(values = trast_colors) +  # Use custom colors
  labs(
    title = "Trend of Prices for Trastuzumab and Its Biosimilars Over the Years",
    x = "Year & Quarter", 
    y = "Payment Limit (USD)"
  ) + 
  theme_minimal() + 
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, size = 10),
    axis.text.y = element_text(size = 10),
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    plot.caption = element_text(size = 8)
  ) + 
  scale_x_discrete(
    limits = unique(filtered_trastuzumab$Quarter_label),  # Ensure all quarters are shown
    breaks = unique(filtered_trastuzumab$Quarter_label),  # Set breaks to all available quarters
    labels = unique(filtered_trastuzumab$Quarter_label)  # Apply the custom formatted labels
  ) + 
  scale_y_continuous(
    labels = scales::dollar_format(prefix = "$"), 
    limits = c(0, max(filtered_trastuzumab$Price, na.rm = TRUE) + 10),  # Adjust Y-axis range
    breaks = seq(0, max(filtered_trastuzumab$Price, na.rm = TRUE) + 10, by = 10)  # Customize Y-axis breaks
  ) + 
  scale_size_identity() +  # Use the custom line thickness mapping
  theme(aspect.ratio = 2/3)  # Set the aspect ratio to 3:2

