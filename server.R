#Calculate BMI score
library(shiny)
# Capture the data from the user interface
shinyServer(function(input, output) {
	# Present gender
	output$ogender <- renderPrint({
		gender<- ifelse(input$gender=='1',"Gender: Male","Gender: Female")
		return(gender)
	})
	# Present Age
	output$oage <- renderPrint({
		age<-as.numeric(Sys.Date()-input$dob)/365.25
		return(paste("Age:",round(age,1),"years"))
	})	
	# Present Weight
	output$oweight <- renderPrint({
		return(paste("Weight:",input$weight,"kilograms"))
	})
	# Present Height
	output$oheight <- renderPrint({
		return(paste("Height:",input$height,"metres"))
	})	
	# calculate BMI score
	output$BMI <- renderPrint({
		BMI<- paste('Your BMI score:',input$weight/(input$height*input$height))
		return(BMI)
	})
	#Possible comments based on BMI values based on wikipedia definitions
	output$ocomment<-renderPrint({
		nBMI<- input$weight/(input$height*input$height)
		ifelse(nBMI<15,oBMI<-"Very severely underweight",
			ifelse(nBMI<16,oBMI<-"Severely underweight",	
			ifelse(nBMI<18.5,oBMI<-"Underweight",
			ifelse(nBMI<25,oBMI<-"Normal/healthy weight",
			ifelse(nBMI<30,oBMI<-"Overweight",
			ifelse(nBMI<35,oBMI<-"Obese Class I (Moderately obese)",
			ifelse(nBMI<40,oBMI<-"Obese Class II (Severely obese",
						oBMI<-"Obese Class III (Very severely obese)"
		)))))))
		return(paste('You are',oBMI))
	})
 })

