shinyServer(function(input, output) {
  output$nText <- renderText({
    # Take a dependency on input$goButton
    input$goButton

    # Use isolate() to avoid dependency on input$goButton
    isolate(input$n)
  })
})
