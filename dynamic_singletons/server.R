shinyServer(function(input, output, session) {
  output$ui3 <- renderUI(sliderInput("slider3", "Slider 3", 1, 10, 5))
  output$ui4 <- renderUI(sliderInput("slider4", "Slider 4", 1, 10, 5))
  output$ui5 <- renderUI(sliderInput("slider5", "Slider 5", 1, 10, 5))

  output$ui1 <- renderUI(sliderInput("slider1", "Slider 1", 1, 10, 5))
  output$ui2 <- renderUI(sliderInput("slider2", "Slider 2", 1, 10, 5))
})