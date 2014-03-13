# textinput
# numberinput
# sliderinput
# dateinput
# daterange
# selectinput
# radioinput
# checkbox
# checkboxgroup
# fileinput
# slider-animate

shinyUI(fluidPage(
  fluidRow(
    column(6,
      selectInput("select.1", "", 1:4),
      radioButtons("radio.1", "", 1:4),
      checkboxInput("checkbox.1", "", 1),
      checkboxGroupInput("checkboxgroup.1", "", 1:4),
      fileInput("file.1", ""),
      sliderInput("slider.1", "", min=1, max=10, value=1, animate=TRUE)
    ),
    column(6,
      verbatimTextOutput("output")
    )
  )
))
