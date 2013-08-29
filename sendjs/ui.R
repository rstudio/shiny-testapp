shinyUI(pageWithSidebar(
  headerPanel("Send Javascript test"),
  sidebarPanel(
    numericInput("controller", "Controller:", min = 1, max = 20, value = 15),
    br()
  ),
  mainPanel(

    div(
      "The text below is set directly via Javascript and JQuery:",
      p(id = "target")
    ),

    # Add a message handler that simply evaluates the message as Javascript
    tags$head(tags$script(HTML('
      Shiny.addCustomMessageHandler("jsCode",
        function(message) {
          eval(message.value);
        }
      );
    ')))
  )
))
