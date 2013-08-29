shinyServer(function(input, output, session) {
  observe({
    js_string <- sprintf('$("#target").text("Value is %d");', input$controller)
    session$sendCustomMessage(type='jsCode', list(value = js_string))
  })
})
