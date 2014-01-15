shinyUI(basicPage(
  h1("Dynamic singletons"),
  p("These wouldn't work at all in Shiny 0.8 and earlier, and in 0.8.0.99 prior to pull request 367 two of the sliders were broken."),
  uiOutput("ui1"),
  uiOutput("ui2"),
  uiOutput("ui3"),
  uiOutput("ui4"),
  uiOutput("ui5")
))