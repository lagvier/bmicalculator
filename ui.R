library(shiny) 
# Application interface
shinyUI(
	pageWithSidebar(
		# Application for calculating Body Mass Index 
		headerPanel(
		h1("Body Mass Index(BMI) calculator"),

		# Required fields body weight(kgs), height in kilograms
		sidebarPanel(
			radioButtons("type","type: ",c("Kgs/Metres"="1","Pounds/Inches"="2")),
			numericInput("weight","Body weight: ",0,min=1,max=500,step=0.1),
			numericInput("height","Enter height: ",0.2,min=0.2,max=10,step=0.01),
			dateInput("dob","Date of birth: ",value = Sys.Date()),
			radioButtons("gender","Gender: ",c("Male"="1","Female"="2")),
			submitButton("Submit")
		),
		
		##Calculated captured results
		mainPanel(
			
			h2("Calculated results"),
			h3("Your details: "),
			verbatimTextOutput("ogender"),
			verbatimTextOutput("oage"),
			verbatimTextOutput("oheight"),
			verbatimTextOutput("oweight"),
			verbatimTextOutput("otype"),
			
			h3("BMI Results"),
			verbatimTextOutput("BMI"),
			h3("Comments: "),
			verbatimTextOutput("ocomment")
		)
	)
)
