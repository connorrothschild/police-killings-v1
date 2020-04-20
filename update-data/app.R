library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    titlePanel(h3("Update Mapping Police Violence Bubble Chart Data")),
    
        mainPanel(
           actionButton("update_data", 'Update Data')
        )
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    observeEvent(input$update_data, {
        source('clean-data.R')
        source('pull-departments.R')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
