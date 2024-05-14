# 02-clear.R


# set colors --------------------------------------------------------------

main_blue <- "#005182"
light_blue <- "#70C4E8"
main_orange <- "#c55434"
dark_orange <- "#90361F"
main_yellow <- "#EBB41F"
light_yellow <- "#FFD780"
NA_color <- "#E6E1E7"
dark_accent <- "#242c3d"
light_accent <- "#cae6f2"
icon_accent <- "#47BA83"
main_colors <- c(light_blue, main_orange, main_yellow, icon_accent, main_blue)



# define vizualization theme ----------------------------------------------

astho_theme <- hc_theme(
  colors = main_colors,
  chart = list(
    backgroundColor = NULL),
  style = list(
    fontFamily = "Jost"),
  title = list(
    style = list(
      color = dark_accent,
      fontFamily = "Jost",
      fontWeight = "500",
      fontSize = "20px")),
  subtitle = list(
    style = list(
      color = dark_accent,
      fontFamily = "Jost",
      fontSize = "14px")),
  caption = list(
    style = list(
      color = "#666",
      fontFamily = "Jost",
      fontSize = "13px")),
  xAxis = list(
    labels = list(
      style = list(
        fontFamily = "Jost",
        fontSize = "15px",
        fontWeight = "normal",
        textOverflow = 'none',
        color = "#666")),
    title = list(
      style = list(
        color = dark_accent,
        fontFamily = "Jost",
        fontWeight = "500",
        fontSize = "15px"))),
  yAxis = list(
    labels = list(
      style = list(
        fontFamily = "Jost",
        fontSize = "20px",
        fontWeight = "normal",
        color = "#666")),
    title = list(
      style = list(
        color = dark_accent,
        fontFamily = "Jost",
        fontWeight = "500",
        fontSize = "15px"))),
  legend = list(
    itemStyle = list(
      fontFamily = "Jost",
      color = dark_accent,
      fontSize = "17px",
      fontWeight = "normal",
      color = "#666"),
    title = list(
      style = list(
        textDecoration = "none",
        fontFamily = "Jost",
        fontSize = "16px"))),
  tooltip = list(
    padding = 10,
    borderRadius = 20,
    backgroundColor = "#fff",
    style = list(
      fontFamily = "Jost",
      fontSize = "16px",
      lineHeight = "20px")),
  itemHoverStyle = list(
    color = light_accent)
)

# clean data --------------------------------------------------------------

# you can use this example below to see how to structure the data

gov <- gov %>%
  select(FIPSCode, JurisdictionName, governance, size, HHSRegion, density, structure, region) %>%
  rename(fips = FIPSCode)  # this fips column must be named fips for it to correct join to the map


data_classes <- gov %>%
  mutate(value = governance) %>% # value you want to map
  group_by(governance) %>%
  summarise(value = unique(value), .groups = "drop") %>%
  arrange(value) %>%
  rename(name = governance, 
         from = value
         ) %>%
  mutate(to = from) %>%
  list_parse() # end of data classes

