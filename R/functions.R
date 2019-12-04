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

get_pant_urs <- function(){
  url       <- "http://esapubs.org/archive/ecol/E090/184/"
  filename  <- "PanTHERIA_1-0_WR05_Aug2008.txt"
  pantheria <- readr::read_delim(file.path(url, filename), delim = "\t")
  pantheria <- readr::read_delim(file.path(url, filename), delim = "\t") %>%
    mutate(                                    # Conversion de type
      family = (MSW05_Family),
      sci_name = (MSW05_Binomial)
    ) %>%
    rename(                                    # Nom des colonnes
      adult_bodymass = `5-1_AdultBodyMass_g`,
      dispersal_age  = `7-1_DispersalAge_d`,
      gestation      = `9-1_GestationLen_d`,
      homerange      = `22-2_HomeRange_Indiv_km2`,
      litter_size    = `16-1_LittersPerYear`,
      longevity      = `17-1_MaxLongevity_m`
    ) %>%
    select(                                    # Sélection de colonnes
      sci_name,
      family,
      adult_bodymass,
      dispersal_age,
      gestation,
      homerange,
      litter_size,
      longevity
    ) %>%
    na_if(-999) %>%
    filter(family == "Ursidae")
  return(pantheria)
}
