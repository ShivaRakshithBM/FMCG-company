# Project

shinyUI(fluidPage(
  titlePanel("Driver Analysis for Retailers' Market Share"),
  
  sidebarLayout(
    
    sidebarPanel(("Select the required combinations"),
                 selectInput("Retailer", "Select the Retailer", choices = c(as.list(as.character(unique(data$Retailer)))), selected = "",selectize = FALSE, multiple = TRUE),
                 selectInput("Category", "Select the Category", choices = c(as.list(as.character(unique(data$Geo)))), selected = "",selectize = FALSE, multiple = TRUE),
                 selectInput('regressand', 'Target Variable', c("Dollar Sales" = "total_dollars", "Units sold" = "Units", "Market Share" = "share"), multiple=FALSE, selectize=FALSE),
                 selectInput('inRegressors', 'Drivers', c(as.list(colnames(Driver_Data))), multiple=TRUE, selected = "",selectize=FALSE)
                 # selectInput('Month', 'Month', c(as.list(unique(Retailer_Month$Month))), selected = "", selectize = FALSE, multiple = TRUE),
                 # selectInput('Year', 'Year', c(as.list(unique(Retailer_Month$Year))), selected = "", selectize = FALSE, multiple = TRUE)
    ),
    
    mainPanel(("Driver information"),
              textOutput("myRetailer"),
              verbatimTextOutput("Model"),
              verbatimTextOutput("Summary_Coeff"),
              verbatimTextOutput("Sum")
              )
  )
)
)


# as.list(unique(Retailer_Month$Month))
# class(unique(Retailer_Month$Geo))
# n = data.frame(unique(Retailer_Month$Geo))
# as.list(as.character(unique(Retailer_Month$Geo)))
# 
# 
# o = as.list(colnames(Drivers_Data))
# as.list(colnames(Drivers_Data))
# data.frame(o)
# m = as.data.frame(as.list(colnames(Drivers_Data)))
# m
# class(m)
# typeof(m)
# 
# class(n)
# typeof(n)

# z = colnames(Drivers_Data)
# typeof(z)
#
# c(as.list(colnames(Retailer_Month)))
# (colnames(Retailer_Month))
# # colnames(temp[,-c(1)])
# # 
# # a = do.call(paste, c(as.list(colnames(temp[,-c(1)])), sep=" + "))
# # b = paste("Geo", a, sep=' ~ ')
# # lm(as.formula(b), data = temp)
# # b
# # as.formula(b)
# # 
# # 
# # temp2 = temp[,input$inRegressors]
# # a = do.call(paste, c(as.list(colnames(temp2)), sep=" + "))
# # b = paste("Geo", a, sep=' ~ ')
# # lm(as.formula(b), data = temp[,input$inRegressors])
# # 
# # b
# # as.formula(b)
# 
# 
