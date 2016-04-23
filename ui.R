shinyUI(
  navbarPage("Navigation Bar",
  tabPanel("Application",
  
  pageWithSidebar(
    # Application title
    headerPanel("Prediction of Car Miles Per Gallon (MPG)"),

    sidebarPanel(
      h2("Description"),
      p("This application is to predict car Miles per Gallon (MPG) based on a linear regression model developed using mtcars dataset."),
      br(),
      h2("Mtcars Dataset Visualization"),
      #checkboxInput("chksummary", "Visualize the summary of mtcars dataset", FALSE),
      numericInput("obs", "Number of observations to view:",5, min=1, max=32,step=1),
      submitButton('Update Obersvations'),
      br(),
      h2("MPG Prediction"),
      p("Please input the following three variables for predicting MPG:"),
      numericInput('wt', 'Weight lb/1000',3.5, min=2, max=5,step=0.5),
      radioButtons('am', 'Transmission Mode', list("0 (Automatic)", "1 (Manual)")),
      numericInput('qsec', '1/4 mile time',18, min=14.5, max=22.5,step=0.5),
      submitButton('Predict')
    ),
    
    mainPanel(
      h2('Mtcars Dataset Visualization'),
      verbatimTextOutput("summary"),
      tableOutput("view"),
      br(),
      h2('Prediction Results'),
      h4('Parameters Input:'),
      p("Weight:"),
      verbatimTextOutput("inputwt"),
      p("Transimission mode:"),
      verbatimTextOutput("inputam"),  
      p("1/4 mile time:"),
      verbatimTextOutput("inputqsec"), 
      h4("Predicted MPG:"),
      verbatimTextOutput("prediction")
    )
  )),
  tabPanel("Documentation",
           includeMarkdown("prediction_of_car_mpg.Rmd")
  )
  )
)