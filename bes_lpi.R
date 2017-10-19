# Extracting exmaple data for use in the BES Annual Meeting 2017 Coding Club Workshop 
# John Godlee (johngodlee@gmail.com)
# 2017_10_19
# LPI public data downloaded from https://figshare.com/articles/LPI_LPR2016data_public_csv/4300022/1, 
	# via https://github.com/Zoological-Society-of-London/rlpi

# Packages ----
library(dplyr)

# setwd to current dir ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load raw LPI data ----
lpi_raw <- read.csv("lpi_public.csv")

# Explore data ----
head(lpi_raw)
str(lpi_raw)

# We only want data for Europe, so filter out Europe records ----
# Check which column holds the Europe identifier, and what is the exact string
unique(lpi_raw$Region)

# Filter out Europe records
lpi_eu <- lpi_raw %>%
	filter(Region == "Europe")

# Extract data for 10 orders ----
# What do the Order values look like?
unique(lpi_eu$Order)  

# How many records are in each Order?
lpi_eu_ord_summ <- lpi_eu %>%
	group_by(Order) %>%
	summarise(n = n()) %>%
	arrange(desc(n))
	
# What are the 10 most common orders?
lpi_eu_ord_comm <- as.vector(lpi_eu_ord_summ$Order[1:10])

# Filter out the 10 most common orders in Europe
lpi_eu_10 <- lpi_eu %>%
	filter(Order %in% lpi_eu_ord_comm)

# Check how many orders are in new data
length(unique(lpi_eu_10$Order))

# Write new data to .csv, .RData ----
write.csv(lpi_eu_10, "lpi_eu_10.csv")
save(lpi_eu_10, file = "lpi_eu_10.RData")
