#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        observeEvent(input$usage, {
                showModal(modalDialog(
                        title = "How to use the App",
                        "Use the slider to select a range of dates. 
                        The graph will show the annual solar spots 
                        for the selected range",
                        footer = modalButton("Got it")
                        ))
        })

    output$distPlot <- renderPlot({

        # 
        start <- input$range[1]
        end <- input$range[2]
        x <- window(sunspot.year, start, end)
        

        # draw the histogram with the specified number of bins
        plot(x, xlim = c(1700, 1988), col = 'darkgray',
             xlab = "Year", ylab = "Sunspots")

    })

})
