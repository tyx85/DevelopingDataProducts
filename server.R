library(shiny) 

## Formula to calculate the BMI
calBMI<-function(weight,height) {weight/(height^2)}


classify<-function(weight,height){
  valueBMI<-weight/(height^2)
  ## Find the correct classification for this user
  ifelse(valueBMI<18.5,"underweight",ifelse(valueBMI<25,"normal weight",ifelse(valueBMI<30,"overweight","obesity")))
  
}

shinyServer(
  function(input, output) {
    
    output$inputweightvalue <- renderPrint({input$weight})
    output$inputheightvalue <- renderPrint({input$height})
    output$estimation <- renderPrint({calBMI(input$weight,input$height)})
    output$diagnostic <- renderPrint({classify(input$weight,input$height)})
  } 
)