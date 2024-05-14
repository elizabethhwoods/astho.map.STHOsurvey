# 01-load


#remotes::install_github("jbkunst/highcharter@8ff41366c8c411b497b5378d27be48617360f81f")
library(remotes)
#remotes::install_github("lindsayjorgenson/custom.map")

# load packages -----------------------------------------------------------

library(highcharter)
library(custom.map)
library(tidyverse)
library(readxl)
library(htmltools)



# load data ---------------------------------------------------------------

# load data here

gov <- read_csv("data/GovStruct.csv")
