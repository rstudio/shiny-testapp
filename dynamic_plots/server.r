max_plots <- 5

shinyServer(function(input, output) {

  # Insert the right number of plot output objects into the web page
  output$plots <- renderUI({
    plot_output_list <- lapply(1:input$n, function(i) {
      plotname <- paste("plot", i, sep="")
      plotOutput(plotname, height = 280, width = 250)
    })

    # Convert the list to a tagList - necessary for it to show
    do.call(tagList, plot_output_list)
  })

  # Call renderPlot for each one. Plots are only actually generated when they
  # are visible on the web page.
  for (i in 1:max_plots) {
    # Need local so that each item gets its own number. Without it, the value
    # of i in the renderPlot() will be the same across all instances, because
    # of when the expression is evaluated.
    local({
      my_i <- i
      plotname <- paste("plot", i, sep="")

      output[[plotname]] <- renderPlot({
        plot(1:my_i, 1:my_i,
             xlim = c(1, max_plots),
             ylim = c(1, max_plots),
             main = paste("1:", my_i, ".  n is ", input$n, sep = "")
        )
      })
    })
  }
})
