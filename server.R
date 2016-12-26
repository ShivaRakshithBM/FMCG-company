library(shiny)
library(dplyr)

# dummy = read.csv("Dummy.csv")

# Retailer_Month = read.csv("Retailer Month.csv")
# temp = Retailer_Month[,-c(2)]
# Drivers_Data = Retailer_Month[,-c(1,2)]
# data = Retailer_Month
# colnames(Retailer_Month)

data = read.csv("unknown.csv")
Driver_Data = data[, c(4:22)]

# Creation of the output variables will take place in server file. Only it will be displayed from the ui.R
# All input variables can be adressed with input$ and 
# simlarly output variables with output$

# All dynamic outputs are calleed reactive outputs
# They are achieved through render functions

server = function(input, output){
  
  regressors <- reactive({
    do.call(paste, c(as.list(input$inRegressors), sep=" + "))
  })
  
  formulaText <- reactive({
    paste(input$regressand,regressors() , sep=' ~ ')
  })
  
  fit <- reactive({ 
    #    lm(as.formula(formulaText()) , data = data[(data$Month == input$Month) & (data$Year == input$Year) & (data$Geo = input$Retailer),]) 
    #    lm(as.formula(formulaText()) , data = filter(data, Month == input$Month & Year == input$Year & Geo == input$Retailer)) 
    
    #data = filter(data, Month == input$Month)
    #data = filter(data, Year == input$Year)
    data = filter(data, Retailer == input$Retailer)
    data = filter(data, Geo == input$Category)
    lm(as.formula(formulaText()) , data = data) 
    
  })
  
  
  # display model fomrula
  output$Model <- renderText({
    paste("Model: ",formulaText(), sep = " ")
  })
  
  output$Summary_Coeff <- renderPrint({
    smry = summary(fit())
    smry$coefficients
  })
  
  output$Sum <- renderPrint({
    smry = summary(fit())
    a = as.data.frame(smry$coefficients)
    a$Driver_Name = row.names(a)
    for (i in 1:nrow(a)){
    print(paste("With 1 unit increase in",a["Driver_Name"][i,],"there is a change of",a["Estimate"][i,], "units of market share"))
    }
  })
  
}

# 
# 
# data %<>% filter(data, Month == input$Month)
# data %<>% filter(data, Year == input$Year)
# data %<>% filter(data, Geo == input$Retailer)
# 
# # asdf
# # asdf = filter(data, data$Year == 2014 & data$Geo == "ACME") 
# # colnames(data)
# # class(data$Month)
# # class(data$Year)
# # # How is multiple regressors saved?

# PACV_tpr is leading to NA 


# # 
# test = filter(data, Geo == "ACME")
# test = filter(test, Month == 3)
# test = filter(test, Year == 2016)
# test = filter(test, Attr1 == "PERSONAL WASH")
# fit = lm(total_dollars ~., data = test[c(12:28)])
# a = summary(fit)
# colnames(test)
# b = as.data.frame(a$coefficients)
# b$Drv = row.names(b)
# b["Drv"][3,]
# b["Estimate"][3,]
# # 
# for (i in 1:3){
#   print(paste(1,1))
# }