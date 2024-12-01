# Define a custom color palette for Trastuzumab and its biosimilars
trast_colors <- c(
  "Trastuzumab" = "#6a3d9a",  # Purple
  "Ogivri" = "#b15928",       # Brown
  "Ontruzant" = "#a6cee3",    # Light Blue
  "Herzuma" = "#b2df8a",      # Light Green
  "Trazimera" = "#fb9a99"     # Pink
)

# Plot with individual biosimilars and jitter
ggplot(trastuzumab_data, aes(x = Drug, y = ASP, fill = Drug)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.7) +  # Box plot without outlier points
  geom_jitter(aes(color = Drug), width = 0.2, size = 1.5, alpha = 0.9) +  # Add jitter
  scale_fill_manual(values = trast_colors) +  # Use custom fill colors for box plots
  scale_color_manual(values = trast_colors) +  # Use custom colors for jitter points
  labs(
    title = "ASP Comparison of Trastuzumab and Individual Biosimilars",
    x = "Drug",
    y = "ASP (USD)"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),  # Rotate x-axis labels
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold")
  )
# Define a custom color palette for Bevacizumab and its biosimilars
bev_colors <- c(
  "Bevacizumab" = "#1f78b4",  # Blue
  "Mvasi" = "#33a02c",        # Green
  "Zirabev" = "#e31a1c",      # Red
  "Alymsys" = "#ff7f00"       # Orange
)

# Plot with individual biosimilars and jitter
ggplot(bev_data, aes(x = Drug, y = ASP, fill = Drug)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.7) +  # Box plot without outlier points
  geom_jitter(aes(color = Drug), width = 0.2, size = 1.5, alpha = 0.9) +  # Add jitter
  scale_fill_manual(values = bev_colors) +  # Use custom fill colors for box plots
  scale_color_manual(values = bev_colors) +  # Use custom colors for jitter points
  labs(
    title = "ASP Comparison of Bevacizumab and Individual Biosimilars",
    x = "Drug",
    y = "ASP (USD)"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),  # Rotate x-axis labels
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold")
  )



