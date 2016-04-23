library(shiny)

mpg<-function(wt, am, qsec){
  if (am=="0 (Automatic)")
  {9.6178-3.9165*wt+1.2259*qsec+2.9358*0}
  else
  {9.6178-3.9165*wt+1.2259*qsec+2.9358*1}

  
}

shinyServer(
  function(input, output){
    #if(input$chksummary){output$summary<-renderPrint({summary(mtcars)})}
    #output$summary<-renderPrint({summary(mtcars)})
    output$view<-renderTable({head(mtcars,n = input$obs)})
    output$inputwt<-renderPrint({input$wt})
    output$inputam<-renderPrint({input$am})
    output$inputqsec<-renderPrint({input$qsec})
    output$prediction<-renderPrint({mpg(input$wt,input$am,input$qsec)})
  }
)