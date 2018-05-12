library(shiny)

# Defines the application UI for drawing a distogram
my_ui <- fluidPage(

   # Defines title of application
   titlePanel("Participation 7"),

   # Defines sidebar to determine number of bins
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 25)
      ),

      # Creates and shows plot of distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Defines the server logic
my_server <- function(input, output) {

   output$distPlot <- renderPlot({
      # Creates bins based on the input from the UI
      x    <- faithful[, 2]
      bins <- seq(min(x), max(x), length.out = input$bins + 1)

      # Outputs the histogram with correct number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Runs the shiny application
shinyApp(ui = my_ui, server = my_server)

