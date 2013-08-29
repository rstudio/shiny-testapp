shinyUI(pageWithSidebar(

  headerPanel("Dynamic number of plots"),

  sidebarPanel(
    numericInput("n", "Number of plots", value=3, min=1, max=5)
  ),

  mainPanel(
    uiOutput("plots")
  )
))
