ui <- pageWithSidebar(
  headerPanel("Setting inputs"),
  sidebarPanel(
    sliderInput("controller", "This slider controls other inputs:",
                min = 1, max = 20, value = 15),

    textInput("inText",  "Text input:",   value="starting value"),
    textInput("inText2", "Text input 2:", value="starting value"),

    numericInput("inNumber", "Number input:",
                 min = 1, max = 20, value = 5, step = 0.5),
    numericInput("inNumber2", "Number input 2:",
                 min = 1, max = 20, value = 5, step = 0.5),

    sliderInput("inSlider", "Slider input:",
                min = 1, max = 20, value = 15),
    sliderInput("inSlider2", "Slider input 2:",
                min = 1, max = 20, value = c(5, 15)),
    sliderInput("inSlider3", "Slider input 3:",
                min = 1, max = 20, value = c(5, 15)),

    dateInput("inDate", "Date input:"),

    dateRangeInput("inDateRange", "Date range input:"),

    checkboxInput("inCheckbox", "Checkbox input:", value = FALSE),

    checkboxGroupInput("inCheckboxGroup", "Checkbox group input:",
                       c("label 1" = "option1",
                         "label 2" = "option2")),
    checkboxGroupInput("inCheckboxGroup2", "Checkbox group input 2:",
                       c("label 1" = "option1",
                         "label 2" = "option2")),

    radioButtons("inRadio", "Radio buttons:",
                 c("label 1" = "option1",
                   "label 2" = "option2")),
    radioButtons("inRadio2", "Radio buttons 2:",
                 c("label 1" = "option1",
                   "label 2" = "option2")),

    selectInput("inSelect", "Select input:",
                c("label 1" = "option1",
                  "label 2" = "option2")),
    selectInput("inSelect2", "Select input 2:", multiple = TRUE,
                c("label 1" = "option1",
                  "label 2" = "option2"))
  ),
  mainPanel(
    tabsetPanel(id = "inTabset",
      tabPanel("panel1", h2("This is the first panel.")),
      tabPanel("panel2", h2("This is the second panel."))
    )
  )
)

server <- function(input, output, clientData, session) {

  observe({
    # We'll use the input$controller variable multiple times, so save it as x
    # for convenience.
    x <- input$controller

    # TRUE if x is even, FALSE otherwise. Will be used below
    x_even <- x %% 2 == 0


    # Text ============================================================
    # This will change the value of input$inText, based on x
    updateTextInput(session, "inText", value = paste("New text", x))

    # Can also set the label, this time for input$inText2
    updateTextInput(session, "inText2",
      label = paste("New label", x),
      value = paste("New text", x))


    # Number ==========================================================
    # Number inputs have more settable parameters
    updateNumericInput(session, "inNumber", value = x)

    updateNumericInput(session, "inNumber2",
      label = paste("Number label ", x),
      value = x, min = x-10, max = x+10, step = 5)


    # Slider input ====================================================
    # Similar to number and text. only label and value can be set for slider
    updateSliderInput(session, "inSlider",
      label = paste("Slider label", x),
      value = x)


    # Slider range input ==============================================
    # For sliders that pick out a range, pass in a vector of 2 values.
    updateSliderInput(session, "inSlider2", value = c(x-1, x+1))

    # An NA means to not change that value (the low or high one)
    updateSliderInput(session, "inSlider3", value = c(NA, x+2))


    # Date input ====================================================
    # Similar to number and text. only label and value can be set for slider
    updateDateInput(session, "inDate",
      label = paste("Date label", x),
      value = paste("2013-04-", x, sep=""))


    # Date range input ================================================
    # Similar to number and text. only label and value can be set for slider
    updateDateRangeInput(session, "inDateRange",
      label = paste("Date range label", x),
      start = paste("2013-01-", x, sep=""),
      end = paste("2013-12-", x, sep=""),
      min = paste("2001-01-", x, sep=""),
      max = paste("2030-12-", x, sep="")
    )

    # Checkbox ========================================================
    updateCheckboxInput(session, "inCheckbox",
      label = paste("Checkbox label", x), value = x_even)


    # Checkbox group ==================================================
    # Create a list of new options, where the name of the items is something
    # like 'option label x 1', and the values are 'option-x-1'.
    cb_options <- list()
    cb_options[[sprintf("option label %d 1", x)]] <- sprintf("option-%d-1", x)
    cb_options[[sprintf("option label %d 2", x)]] <- sprintf("option-%d-2", x)

    # Change values for input$inCheckboxGroup
    updateCheckboxGroupInput(session, "inCheckboxGroup", choices = cb_options)

    # Can also set the label and select items
    updateCheckboxGroupInput(session, "inCheckboxGroup2",
      label = paste("checkboxgroup label", x),
      choices = cb_options,
      selected = sprintf("option-%d-2", x)
    )

    # Radio group =====================================================
    # Create a list of new options, where the name of the items is something
    # like 'option label x 1', and the values are 'option-x-1'.
    r_options <- list()
    r_options[[sprintf("option label %d 1", x)]] <- sprintf("option-%d-1", x)
    r_options[[sprintf("option label %d 2", x)]] <- sprintf("option-%d-2", x)

    # Change values for input$inRadio
    updateRadioButtons(session, "inRadio", choices = r_options)

    # Can also set the label and select an item
    updateRadioButtons(session, "inRadio2",
      label = paste("Radio label", x),
      choices = r_options,
      selected = sprintf("option-%d-2", x)
    )


    # Select input ====================================================
    # Create a list of new options, where the name of the items is something
    # like 'option label x 1', and the values are 'option-x-1'.
    s_options <- list()
    s_options[[sprintf("option label %d 1", x)]] <- sprintf("option-%d-1", x)
    s_options[[sprintf("option label %d 2", x)]] <- sprintf("option-%d-2", x)

    # Change values for input$inSelect
    updateSelectInput(session, "inSelect", choices = s_options)

    # Can also set the label and select an item (or more than one if it's a
    # multi-select)
    updateSelectInput(session, "inSelect2",
      label = paste("Select label", x),
      choices = s_options,
      selected = sprintf("option-%d-2", x)
    )


    # Tabset input ==========================================================
    # Change the selected tab.
    # The tabsetPanel must have been created with an 'id' argument
    if (x_even) {
      updateTabsetPanel(session, "inTabset", selected = "panel2")
    } else {
      updateTabsetPanel(session, "inTabset", selected = "panel1")
    }
  })
}

shinyApp(ui, server)
