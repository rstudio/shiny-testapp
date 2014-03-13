#  selectInput("select.1", "", 1:4),
#  radioButtons("radio.1", "", 1:4),
#  checkboxInput("checkbox.1", "", 1),
#  checkboxGroupInput("checkboxgroup.1", "", 1:4),
#  fileInput("file.1", ""),
#  sliderInput("slider.1", "", min=1, max=10, value=1, animate=TRUE)


shinyServer(function(input, output, session) {
  updateSelectInput(session, "select.1", label="Select")
  updateRadioButtons(session, "radio.1", label="Radio")
  updateCheckboxInput(session, "checkbox.1", label="Checkbox")
  updateCheckboxGroupInput(session, "checkboxgroup.1", label="Checkbox group")
  updateSliderInput(session, "slider.1", label="Slider")

  output$output <- renderPrint(reactiveValuesToList(input))
})
