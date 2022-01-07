#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates
# Intro to Shiny
#=============#

rm(list = ls())

# install.packages("shiny") # necessary if you don't already have the function 'shiny' installed.

# we need the function shiny installed, this loads it from the library.
library(shiny)             


#================================================================
#                   Create User Interface
#================================================================

ui <- fluidPage(    # create user interface using fluidpage function
  
      numericInput(inputId = "x",      # id of input, used in server (https://shiny.rstudio.com/gallery/widget-gallery.html)
                   label = "number",  # label next to numeric input
                   value = 200,               # initial value
                   min = 0,                   # minimum value allowed
                   max = 1000),                # maximum value allowed

      textOutput(outputId = "printvalue")                    # heading (results table)                
      
  
) # close UI fluidpage


#================================================================
#                     Create Server Function
#================================================================

server <- function(input, output){   # server = function with two inputs
  
                 
                 #--- CREATE NUMBER IN SERVER ---#
                 output$printvalue <- renderText({
                   
                   paste("number x 10 = ", input$x * 10)
                   
                 }) # render Text end.
                 
  
  
} # Server end





## ----- run app------

shinyApp(ui, server)