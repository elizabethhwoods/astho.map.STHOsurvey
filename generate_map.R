
# here you can create the map!
create_map(
  data = gov,
  my_value = "governance", 
  title_text = "Map of State and Island Area Public Health Agency Governance",
  subtitle_text = "2022", 
  caption_text = 
    "<b> Source: </b> Association of State and Territorial Health Officials. 
    ASTHO Profile of State and Territorial Public Health, Volume Six. Arlington, 
    VA: Association of State and Territorial Health Officials. 2023.",
  accessible_desc = 
    "This is a map of governance classification, with sost jurisdictions being 
    decentralized followed by centralized. Few jurisdictions are mixed. Enter the 
    map to review classification at the jurisdiction level.",
  my_tooltip = 
    "<b>{point.JurisdictionName}</b><br>
    <b>Agency Governance:</b>   {point.governance}<br>
    <b>Agency Structure:</b>   {point.structure}<br>
    <b>HHS Region:</b>   {point.HHSRegion}<br>
    <b>Population Size:</b>   {point.size}<br>", # this does not matter if you plan to use it statically
)
