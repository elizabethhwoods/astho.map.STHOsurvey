# 03-func.R


# Highcharter Map Function ------------------------------------------------

create_map <- function( data,  # do not quote this
                       my_value, # value you want to map
                       data_class = data_classes, # you don't need to change this
                       my_colors = main_colors, # this controls the colors, you may need to change
                       my_click = NA, # this is only for interactive charts if you want something to happen when clicking a state
                       title_text, # title
                       subtitle_text, # content under the title
                       caption_text, # source line and notes
                       legend_text = NA, # the header for the legend, if you want one
                       accessible_desc, # alt-text for the map
                       my_tooltip, # tooltip info
                       my_reverse = FALSE # this reverses the legend, sometimes you might need this true
) {

  
  hc <- highchart(type = "map") %>%
    hc_add_dependency(
      name = "modules/accessibility.js"
    ) %>%
    hc_add_dependency(
      name = "modules/exporting.js"
      ) %>%
    hc_add_dependency(
      name = "modules/export-data.js"
      ) %>%
    hc_add_dependency(
      name = "modules/pattern-fill.js"
      ) %>%
    hc_add_custom_map_cat(
      data = data,
      value = my_value,
      joinBy = "fips",
      mapType = "c",
      borderColor = "#020202",
      borderWidth = .25,
      dataLabels = list(
        enabled = FALSE, 
        format = "{point.state}"
      ),
      accessibility = list(
        enabled = TRUE,
        exposeAsGroupOnly = TRUE,
        keyboardNavigation = list(
          enabled = TRUE),
        linkedDescription = accessible_desc
      )
    ) %>%
    hc_chart(
      height = 600
    ) %>%
    hc_colors(
      colors = my_colors
    ) %>%
    hc_colorAxis(
      dataClassColor = "category",
      dataClasses = data_class
    ) %>%
    hc_plotOptions(
      series = list(
        events = list(
          click = my_click
        ),
        accessibility = list(
          enabled = TRUE,
          description = accessible_desc,
          keyboardNavigation = list(
            enabled = TRUE
          )
        )
      )
    ) %>%
    hc_title(
      text = title_text, # title text
      margin = 10
    ) %>%
    hc_subtitle(
      text = subtitle_text, # text under title
      align = "center"
    ) %>%
    hc_caption(
      text = caption_text, # source and data notes
      useHTML = TRUE,
      margin = 20,
      align = "center"
    ) %>%
    hc_legend(
      reversed = my_reverse,
      enabled = TRUE,
      layout = "horizontal",
      align = "center",
      verticalAlign = "bottom",
      itemMarginBottom = 3,
      itemMarginTop = 3,
      margin = 22,
      title = list(
        text = legend_text
      )
    ) %>%
    hc_tooltip(
      headerFormat = "{point.JurisdictionName}",
      pointFormat = my_tooltip,
      useHTML = TRUE
    ) %>%
    hc_add_theme(
      astho_theme
    ) %>%
    hc_exporting(
      enabled = TRUE,
      accessibility = list(
        enabled = TRUE
      ),
      formAttributes = list(
        target = "_blank" # opens in new window
      ),
      sourceHeight = 700, # sets height of download
      sourceWidth = 1200, # sets width of download
      allowHTML = TRUE, 
      url = "https://exporter.opifex.org", #serve owned by John Coene
      buttons = list(
        contextButton = list(
          symbol = "menu",
          symbolStrokeWidth = 2,
          symbolFill = icon_accent,
          symbolStroke = icon_accent,
          menuItems = c("printChart",
                        "separator",
                        "downloadPNG",
                        "downloadJPEG",
                        "downloadPDF",
                        "downloadSVG",
                        "separator",
                        "downloadCSV",
                        "downloadXLS",
                        "openInCloud")
        )
      )
    )
  return(hc)
}
