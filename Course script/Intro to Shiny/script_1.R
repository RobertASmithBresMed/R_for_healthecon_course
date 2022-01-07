#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates
# Intro to Shiny
#=============#


# install.packages("shiny") # necessary if you don't already have the function 'shiny' installed.

# we need the function shiny installed, this loads it from the library.
library(shiny)             


#================================================================
#                   Create User Interface
#================================================================

ui <- fluidPage(    # create user interface using fluid-page function
  
  "hello"
  
) # close UI fluidpage


#================================================================
#                     Create Server Function
#================================================================

server <- function(input, output){   
  
  # server function

  
} # Server end





## ----- run app------

shinyApp(ui = ui, server = server)