# Extracting exmaple data for use in the BES Annual Meeting 2017 Coding Club Workshop 
# John Godlee (johngodlee@gmail.com)
# 2017_10_19
# LPI data downloaded from https://figshare.com/articles/LPI_LPR2016data_public_csv/4300022/1, 
	# via https://github.com/Zoological-Society-of-London/rlpi

# Packages ----
library(dplyr)

# setwd to current dir ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load raw LPI data ----
lpi_raw <- read.csv("lpi_public.csv")

# 