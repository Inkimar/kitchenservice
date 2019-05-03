library(shiny)

ui <- fluidPage(
  h1(textOutput("week")),
  fluidRow(column(12, tableOutput('table')))
  )

server <- function(input,output) {
  kitchenURL <- fread('https://raw.github.com/wiki/Inkimar/kitchen-service/kitchen.md')
  rubrik <- 'Köksvecka, för vecka'
  currentWeek <- week(Sys.time())
  comb <- paste(rubrik,currentWeek)
  thisweek <- filter(kitchenURL, week == currentWeek)
  thisweekSelect <- select(thisweek, name1, name2)
  output$table <- renderTable(thisweekSelect)
  output$week <- renderText(comb)
  }

shinyApp(ui = ui, server = server)
