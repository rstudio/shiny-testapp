shinyUI(pageWithSidebar(
  headerPanel("actionButton test"),
  sidebarPanel(
    numericInput("n", "N:", min = 0, max = 100, value = 50),
    br(),
    actionButton("goButton", "Go!")
  ),
  mainPanel(
    verbatimTextOutput("nText")
  )
))
