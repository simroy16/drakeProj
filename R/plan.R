plan <- drake_plan(
  #### get data ####
  # Wildfinder data
  wf_ursidae_raw = get_ursidae(),
  wf_ecoregions = get_ecoregions(),
  wf_sp_eco = get_sp_eco())