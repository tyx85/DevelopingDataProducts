library(shiny) 
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Personalize BMI (Body Mass Index) Calculator"),
    
    sidebarPanel(
      numericInput('height', 'Insert your height in metres (m)', 1.70, min = 0.2, max = 3, step = 0.01),
      numericInput('weight', 'Insert your weight in kilograms (kg)', 70) ,
      submitButton('Submit')
    ), 
    mainPanel(
      p('Body Mass Index (BMI) is a number calculated from a person weight and height. BMI provides a reliable indicator of body fatness for most people and is used to screen for weight categories that may lead to health problems.'),
      p('With regards to the BMI measurement, the World Health Organization (WHO) proposes the following classification:'),
      p('To start using, please select your height and weight at the left hand side of the bar.'),
      tags$div(
        tags$ul(
          tags$li('BMI greater than or equal to 30    : Obesity'),
          tags$li('BMI between 25 to 29.9             : Overweight'),
          tags$li('BMI between 18.5 to 24.9           : Normal weight'),
          tags$li('BMI less than 18.5                 : Underweight')
        )
      ),
      
      h4('The following are the values entered by you:'), 
      p('height (m):'), verbatimTextOutput("inputheightvalue"),
      p('weight (kg):'), verbatimTextOutput("inputweightvalue"),
      h4('Calculated BMI is:'),
      verbatimTextOutput("estimation"),
      p('With the above BMI measurements, it means that you are:'),strong(verbatimTextOutput("diagnostic")),
      h4('Formula to calculate BMI'), 
      p('weight/(height^2)')
      
    )
    
  )   
)