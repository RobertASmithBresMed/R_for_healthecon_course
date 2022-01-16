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
  
      numericInput(inputId = "x",           # id of input, used in server
                   label = "Number X",          # label next to numeric input
                   value = 200,               # initial value
                   min = 0,                   # minimum value allowed
                   max = 1000),              # maximum value allowed
                   
      numericInput(inputId = "y",      # id of input, used in server
                   label = "Number Y",        # label next to numeric input
                   value = 200,              # initial value
                   min = 0,                   # minimum value allowed
                   max = 400),                # maximum value allowed
                   
      actionButton(inputId = "run_model",     # id of action button, used in server
                   label   = "Run model"), # action button end
      
      
      textOutput(outputId = "printvalue")     # text output                
      
  
) # close UI fluid page


#================================================================
#                     Create Server Function
#================================================================

server <- function(input, output){   # server = function with two inputs
  
  observeEvent(input$run_model,       # when action button pressed ...
                {
                 
     sum_x_y = input$x + input$y
  
  #--- CREATE NUMBER IN SERVER ---#
  output$printvalue <- renderText({
    
    paste("Sum of x and y = ", sum_x_y)
    
  }) # render Text end.
  
  
}) # Observe Event End  
  
  
} # Server end





## ----- run app------

shinyApp(ui, server)
