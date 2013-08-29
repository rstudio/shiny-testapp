shinyUI(basicPage(
  p("This will put a cross at a location wherever the mouse hovers for 150ms, and a red circle whenever the mouse is clicked."),
  plotOutput("myplot", clickId = "myplot_click", hoverId = "myplot_hover",
    hoverDelay = 150, width = 400, height = 400),
  tableOutput("mytable")
))
