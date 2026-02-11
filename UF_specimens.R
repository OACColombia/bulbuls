# Florida Museum of Natural History
library(tidyverse)
# data downloaded from Specify

flmnh_bulbuls <- read.csv("_Family_Pycn.csv")
str(flmnh_bulbuls)

table(flmnh_bulbuls$Preparations)

UF_bulbuls_skins <- flmnh_bulbuls |>
  filter(Preparations %in% c("STUDY",
                             "STUDY - 1")) |>
  unite("scientific_name", Genus, Species, sep = " ", remove = FALSE) |>
  mutate(scientific_name = sapply(scientific_name, tolower),
         scientific_name = paste0(toupper(substr(scientific_name, 1,1)),
                                  substr(scientific_name, 2, nchar(scientific_name))))

length(unique(UF_bulbuls_skins$scientific_name))

write_csv(UF_bulbuls_skins, "UF_bulbuls_skins.csv")
