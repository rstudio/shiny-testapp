shinyUI(pageWithSidebar(
  headerPanel("Shiny Client Data"),
  sidebarPanel(
    numericInput("n", "N:", min = 0, max = 100, value = 50),
    p("Shiny version: ", as.character(packageVersion('shiny')))
  ),
  mainPanel(
    
    h3("clientData values"),
    verbatimTextOutput("summary"),   # clientData values
    h3("Parsed URL query"),
    verbatimTextOutput("queryText"),   # clientData values
    imageOutput("image", height=300),
    plotOutput("plot", height=300)
  )
))
