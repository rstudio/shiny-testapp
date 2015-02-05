ui <- fluidPage(
  titlePanel("Input appearance"),
  sidebarLayout(
    sidebarPanel(
      p("Some input items below have NULL labels."),
      textInput("text1", "Text", value = "Starting value"),
      textInput("text2", NULL, value = "No label"),

      numericInput("num1", "Number", min = 1, max = 20, value = 5, step = 0.5),
      numericInput("num2", NULL, min = 1, max = 20, value = 5, step = 0.5),

      sliderInput("slider1", "Slider", min = 1, max = 20, value = 15),
      sliderInput("slider2", NULL, min = 1, max = 20, value = 15),
      sliderInput("slider3", "Slider range", min = 1, max = 20, value = c(5, 15)),

      checkboxInput("check1", "Checkbox", value = FALSE),
      checkboxInput("check2", NULL, value = TRUE),

      checkboxGroupInput("checkgroup1", "Checkbox group",
                         c("label 1" = "option1", "label 2" = "option2")),
      checkboxGroupInput("checkgroup2", NULL,
                         c("label 1" = "option1", "label 2" = "option2")),
      checkboxGroupInput("checkgroup3", "Checkbox group inline", inline = TRUE,
                         c("label 1" = "option1", "label 2" = "option2")),
      checkboxGroupInput("checkgroup4", NULL, inline = TRUE,
                         c("label 1" = "option1", "label 2" = "option2")),

      radioButtons("radio1", "Radio",
                   c("label 1" = "option1", "label 2" = "option2")),
      radioButtons("radio2", NULL,
                   c("label 1" = "option1", "label 2" = "option2")),
      radioButtons("radio3", "Radio inline", inline = TRUE,
                   c("label 1" = "option1", "label 2" = "option2")),
      radioButtons("radio4", NULL, inline = TRUE,
                   c("label 1" = "option1", "label 2" = "option2")),


      selectInput("select1", "Select - selectize",
                  c("label 1" = "option1", "label 2" = "option2")),
      selectInput("select2", NULL,
                  c("label 1" = "option1", "label 2" = "option2")),
      selectInput("select3", "Select - selectize multiple", multiple = TRUE,
                  c("label 1" = "option1", "label 2" = "option2")),

      selectInput("select4", "Select - non-selectize", selectize = FALSE,
                  c("label 1" = "option1", "label 2" = "option2")),
      selectInput("select5", NULL, selectize = FALSE,
                  c("label 1" = "option1", "label 2" = "option2")),
      selectInput("select6", "Select - non-selectize multiple",  selectize = FALSE, multiple = TRUE,
                  c("label 1" = "option1", "label 2" = "option2")),

      dateInput("date", "Date"),

      dateRangeInput("daterange", "Date range")
    ),
    mainPanel(
      tabsetPanel(id = "inTabset",
        tabPanel("panel1", h2("This is the first panel.")),
        tabPanel("panel2", h2("This is the second panel."))
      )
    )
  )
)

server <- function(input, output, clientData, session) {}

shinyApp(ui, server)
