library(shiny)
library(markdown)

shinyUI(
navbarPage("GDP World Map",
           tabPanel("Map",
            shinyUI(pageWithSidebar(
              headerPanel("GDP World Map"),
              sidebarPanel(
               numericInput('year','Select year you want to see',1960,min = 1960,max = 2015,step = 1),
               submitButton('Submit')
              ),
              mainPanel(
                h3('Data visualization of GDP at each country'),
                plotOutput("gdpMap")
              )
            ))
           ),
           tabPanel("About",
                    mainPanel(
                      includeMarkdown("about.md")
                    )
           )
)
)