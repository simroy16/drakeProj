get_ursidae <- function(){
  mammals <- read.csv("data/wildfinder-mammals_list.csv")
  result <- filter(mammals, family == "Ursidae") %>%
    mutate_all(as.character)
  return(result)
}
get_ecoregions <- function(){
  ecoregions <- read.csv("data/wildfinder-ecoregions_list.csv")
  return(ecoregions)
}
get_sp_eco <- function(){
  sp_eco <- read.csv("data/wildfinder-ecoregions_species.csv")
  return(sp_eco)
}
