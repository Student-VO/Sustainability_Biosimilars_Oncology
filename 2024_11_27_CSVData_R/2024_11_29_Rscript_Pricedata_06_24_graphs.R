# Load required libraries
library(dplyr)
library(tidyr)
library(ggplot2)

# Read all files for 2006 to 2024 with the correct skip values
Q4_06 <- read.csv("Q4_2006_2016/Section 508 version of October 2006 ASP Pricing File.csv", skip = 10, check.names = FALSE)
Q4_07 <- read.csv("Q4_2006_2016/Section 508 version of October 2007 ASP Pricing File.csv", skip = 10, check.names = FALSE)
Q4_08 <- read.csv("Q4_2006_2016/Section 508 version of October 2008 ASP Pricing File.csv", skip = 10, check.names = FALSE)

Q4_09 <- read.csv("Q4_2006_2016/Section 508 version of October 2009 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q4_10 <- read.csv("Q4_2006_2016/Section 508 version of October 2010 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q4_11 <- read.csv("Q4_2006_2016/Section 508 version of October 2011 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q4_12 <- read.csv("Q4_2006_2016/Section 508 version of October 2012 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q4_13 <- read.csv("Q4_2006_2016/Section 508 version of October 2013 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q4_14 <- read.csv("Q4_2006_2016/Section 508 version of October 2014 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q4_15 <- read.csv("Q4_2006_2016/Section 508 version of October 2015 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q4_16 <- read.csv("Q4_2006_2016/Section 508 version of October 2016 ASP Pricing File.csv", skip = 9, check.names = FALSE)

Q4_17 <- read.csv("2017/Section 508 version of October 2017 ASP Pricing File.csv", skip = 9, check.names = FALSE)

Q1_18 <- read.csv("2018/Section 508 version of January 2018 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q2_18 <- read.csv("2018/Section 508 version of April 2018 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q3_18 <- read.csv("2018/Section 508 version of July 2018 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q4_18 <- read.csv("2018/Section 508 version of October 2018 ASP Pricing File.csv", skip = 9, check.names = FALSE)

Q1_19 <- read.csv("2019/Section 508 version of January 2019 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q2_19 <- read.csv("2019/Section 508 version of April 2019 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q3_19 <- read.csv("2019/Section 508 version of July 2019 ASP Pricing File.csv", skip = 9, check.names = FALSE)
Q4_19 <- read.csv("2019/Section 508 version of October 2019 ASP Pricing File.csv", skip = 9, check.names = FALSE)

Q1_20 <- read.csv("2020/Section 508 version of January 2020 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q2_20 <- read.csv("2020/Section 508 version of April 2020 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q3_20 <- read.csv("2020/Section 508 version of July 2020 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q4_20 <- read.csv("2020/Section 508 version of October 2020 ASP Pricing File.csv", skip = 8, check.names = FALSE)

Q1_21 <- read.csv("2021/Section 508 version of January 2021 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q2_21 <- read.csv("2021/Section 508 version of April 2021 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q3_21 <- read.csv("2021/Section 508 version of July 2021 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q4_21 <- read.csv("2021/Section 508 version of October 2021 ASP Pricing File.csv", skip = 8, check.names = FALSE)

Q1_22 <- read.csv("2022/Section 508 version of January 2022 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q2_22 <- read.csv("2022/Section 508 version of April 2022 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q3_22 <- read.csv("2022/Section 508 version of July 2022 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q4_22 <- read.csv("2022/Section 508 version of October 2022 ASP Pricing File.csv", skip = 8, check.names = FALSE)

Q1_23 <- read.csv("2023/Section 508 version of January 2023 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q2_23 <- read.csv("2023/Section 508 version of April 2023 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q3_23 <- read.csv("2023/Section 508 version of July 2023 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q4_23 <- read.csv("2023/Section 508 version of October 2023 ASP Pricing File.csv", skip = 8, check.names = FALSE)

Q1_24 <- read.csv("2024/Section 508 version of January 2024 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q2_24 <- read.csv("2024/Section 508 version of April 2024 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q3_24 <- read.csv("2024/Section 508 version of July 2024 ASP Pricing File.csv", skip = 8, check.names = FALSE)
Q4_24 <- read.csv("2024/Section 508 version of October 2024 ASP Pricing File.csv", skip = 8, check.names = FALSE)


# List of drugs and HCPCS codes
drug_list <- c("Bevacizumab", "Mvasi", "Zirabev", "Alymsys", "Trastuzumab", 
               "Ogivri", "Ontruzant", "Herzuma", "Trazimera")

hcpcs_codes <- c("J9035", "Q5107", "Q5118", "Q5126", "J9355",
                 "Q5114", "Q5112", "Q5113", "Q5116")


# Create a mapping of drug names to their corresponding HCPCS codes
drug_hcpcs_mapping <- data.frame(
  Drug = drug_list,
  HCPCS_Code = hcpcs_codes)

# Create a list of all quarter data
quarter_data_list <- list(
  Q4_06 = Q4_06, Q4_07 = Q4_07, Q4_08 = Q4_08,
  Q4_09 = Q4_09, Q4_10 = Q4_10, Q4_11 = Q4_11, Q4_12 = Q4_12, Q4_13 = Q4_13,
  Q4_14 = Q4_14, Q4_15 = Q4_15, Q4_16 = Q4_16,
  Q4_17 = Q4_17,
  Q1_18 = Q1_18, Q2_18 = Q2_18, Q3_18 = Q3_18, Q4_18 = Q4_18,
  Q1_19 = Q1_19, Q2_19 = Q2_19, Q3_19 = Q3_19, Q4_19 = Q4_19,
  Q1_20 = Q1_20, Q2_20 = Q2_20, Q3_20 = Q3_20, Q4_20 = Q4_20,
  Q1_21 = Q1_21, Q2_21 = Q2_21, Q3_21 = Q3_21, Q4_21 = Q4_21,
  Q1_22 = Q1_22, Q2_22 = Q2_22, Q3_22 = Q3_22, Q4_22 = Q4_22,
  Q1_23 = Q1_23, Q2_23 = Q2_23, Q3_23 = Q3_23, Q4_23 = Q4_23,
  Q1_24 = Q1_24, Q2_24 = Q2_24, Q3_24 = Q3_24, Q4_24 = Q4_24
)

# Initialize an empty data frame for the final results
drugprice_table <- data.frame()

# Loop over all drugs and get their data
for (i in 1:nrow(drug_hcpcs_mapping)) {
  drug_name <- drug_hcpcs_mapping$Drug[i]
  hcpcs_code <- drug_hcpcs_mapping$HCPCS_Code[i]
  
  # Initialize a vector to store the payment limits for each quarter
  payment_limits <- c()
  
  # Loop through each quarter and search for the HCPCS code
  for (quarter_name in names(quarter_data_list)) {
    quarter_data <- quarter_data_list[[quarter_name]]
    
    # Clean column names to ensure consistency
    colnames(quarter_data) <- trimws(colnames(quarter_data))  # Remove leading/trailing spaces
    colnames(quarter_data)[colnames(quarter_data) == ""] <- NA  # Replace empty names with NA
    quarter_data <- quarter_data[, !is.na(colnames(quarter_data))]  # Remove columns with NA names
    
    # Check if the HCPCS code exists in this quarter data
    match <- quarter_data %>%
      filter(`HCPCS Code` == hcpcs_code) %>%
      select(`HCPCS Code`, `Payment Limit`)
    
    # If found, extract the payment limit, otherwise set to NA
    if (nrow(match) > 0) {
      payment_limit <- match$`Payment Limit`[1]  # Take the first match if there are multiple
    } else {
      payment_limit <- NA
    }
    
    # Add the payment limit (NA if not found)
    payment_limits <- c(payment_limits, payment_limit)
  }
  
  # Combine the HCPCS code, drug name, and payment limits into a row for the final table
  drug_row <- c(hcpcs_code, drug_name, payment_limits)
  
  # Append this row to the final table
  drugprice_table <- rbind(drugprice_table, drug_row)
}

# Set the column names for the final table
quarter_columns <- c("HCPCS_Code", "Drug", paste("Payment_Limit_Q_", names(quarter_data_list), sep = ""))
colnames(drugprice_table) <- quarter_columns

# Convert the table into a data frame
drugprice_table <- as.data.frame(drugprice_table)

# View the final combined table
View(drugprice_table)


# PLOTTING

# Reshape the data from wide to long format
drug_prices_long <- drugprice_table %>%
  pivot_longer(
    cols = starts_with("Payment_Limit_Q_"),  # Adjust if the prefix is different
    names_to = "Quarter",
    values_to = "Price"
  ) %>%
  mutate(Quarter = gsub("Payment_Limit_Q_", "", Quarter))  # Clean up the quarter names

# Create a new column for Year and Quarter
drug_prices_long <- drug_prices_long %>%
  mutate(
    Year = substr(Quarter, 2, 5),  # Extract year from the quarter (e.g., "Q1_21" -> "2021")
    Quarter_label = paste0("Q", substr(Quarter, 2, 2), " '", substr(Year, 3, 4))  # Format as "Q1 '19"
  )

# Filter the data for the selected drugs
selected_drugs <- c("Bevacizumab", "Mvasi", "Zirabev", "Alymsys")
filtered_drugs <- drug_prices_long %>%
  filter(Drug %in% selected_drugs) %>%
  filter(!is.na(Price))  # Remove rows with missing price data

# Ensure 'Price' column is numeric (remove any dollar signs or commas if present)
filtered_drugs$Price <- as.numeric(gsub("[$,]", "", filtered_drugs$Price))

# Set the line thickness for Bevacizumab (adjustable)
Line_Width <- 1  # Thicker line for Bevacizumab
filtered_drugs <- filtered_drugs %>%
  mutate(Line_Width = ifelse(Drug == "Bevacizumab", Line_Width, 1))  # Adjust line thickness for Bevacizumab

# Plot the trend of prices for the selected drugs over the years
ggplot(filtered_drugs, aes(x = Quarter_label, y = Price, group = Drug, color = Drug)) + 
  geom_line(aes(size = Line_Width)) +  # Only lines, no points
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

#MORE PLOT
# PLOTTING

# Reshape the data from wide to long format for Trastuzumab data
trastuzumab_prices_long <- drugprice_table %>%
  pivot_longer(
    cols = starts_with("Payment_Limit_Q_"),  # Adjust if the prefix is different
    names_to = "Quarter",
    values_to = "Price"
  ) %>%
  mutate(Quarter = gsub("Payment_Limit_Q_", "", Quarter))  # Clean up the quarter names

# Create a new column for Year and Quarter
trastuzumab_prices_long <- trastuzumab_prices_long %>%
  mutate(
    Year = substr(Quarter, 2, 5),  # Extract year from the quarter (e.g., "Q1_21" -> "2021")
    Quarter_label = paste0("Q", substr(Quarter, 2, 2), " '", substr(Year, 3, 4))  # Format as "Q1 '19"
  )

# Filter the data for Trastuzumab and its biosimilars
trastuzumab_and_biosimilars <- c("Trastuzumab", "Ogivri", "Ontruzant", 
                                 "Herzuma", "Trazimera")

filtered_trastuzumab <- trastuzumab_prices_long %>%
  filter(Drug %in% trastuzumab_and_biosimilars) %>%
  filter(!is.na(Price))  # Remove rows with missing price data

# Ensure 'Price' column is numeric (remove any dollar signs or commas if present)
filtered_trastuzumab$Price <- as.numeric(gsub("[$,]", "", filtered_trastuzumab$Price))

# Set the line thickness for Trastuzumab and biosimilars (adjustable)
Line_Width <- 1  # Default line thickness
filtered_trastuzumab <- filtered_trastuzumab %>%
  mutate(Line_Width = ifelse(Drug == "Trastuzumab", Line_Width, 1))  # Thicker line for Trastuzumab

# Plot the trend of prices for Trastuzumab and its biosimilars over the years
ggplot(filtered_trastuzumab, aes(x = Quarter_label, y = Price, group = Drug, color = Drug)) + 
  geom_line(aes(size = Line_Width)) +  # Only lines, no points
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


