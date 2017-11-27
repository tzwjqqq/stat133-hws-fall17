
library(shiny)
library(ggvis)
source('~/stat133-hws-fall17/hw04/code/functions.R')
# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Grade Visualizer"),
  
  h4("Observations"),
  tableOutput("view"),
  
  
  selectInput("select", label = h3("Select box"), 
              choices = list("HW1" = "HW1", "HW2" = "HW2",
                             "HW3" = "HW3", "HW4" = "HW4",
                             "HW5" = "HW5", "HW6" = "HW6",
                             "HW7" = "HW7", "HW8" = "HW8",
                             "HW9" = "HW9"), 
              selected = "HW1"),
  sliderInput("width",
              "Bind width",
              min = 0,
              max = 110,
              value = 10),
  
  selectInput("variableX", label = h3("X-axis variable"),
              choices = list("Test1" = "Test1", "Test2" = "Test2"), 
              selected = "Test1"),
  
  selectInput("variableY", label = h3("Y-axis variable"),
              choices = list("Overall" = "Overall"), 
              selected = "Overall"),
  
  h4("Summary"),
  verbatimTextOutput("summary"),
  
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Barchart",  plotOutput("bar")),
        tabPanel("Histogram", ggvisOutput("hist")),
        tabPanel("ScatterPlot", plotOutput("scatter"))
      )
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$bar <- renderPlot({
    # generate bins based on input$bins from ui.R
    
    # draw the histogram with the specified number of bins
    grades = factor(dat$Grade, levels = c('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D', 'F'))
    barplot(table(grades), col = 'blue', border = 'white')
  })
  
  grades = factor(dat$Grade, levels = c('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D', 'F'))
  output$view <- renderTable({
    data.frame("grade" = table(grades), "freq" = prop.table(table(grades)))
  })
  
  
  vis_plot <- reactive({
    
    # since the inputs are strings, we need to do a little more work.
    xvar <- prop("x", as.symbol(input$select))
    
    
    histogram <- dat %>%
      ggvis(x = xvar) %>%
      layer_histograms(stroke := 'white', width = input$width)
  })
  
  vis_plot %>% bind_shiny("hist")
  
  output$summary <- renderPrint({
    print_stats(summary_stats(dat$HW1))
  })
  
  output$scatter <- renderPlot({
    # generate bins based on input$bins from ui.R
    
    # draw the histogram with the specified number of bins
    plot(dat$Test1, dat$Overall, color = 'darkgray', border = 'grey', fill = 'grey')
  })
  
  
}


# Run the application 
shinyApp(ui = ui, server = server)
