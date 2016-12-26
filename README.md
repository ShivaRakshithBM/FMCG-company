# FMCG-company

Problem statement: 
Identify the factors which affecct the sales at retailer level and product vcategory level. 

Initial State:
The FMCG company is not aware of the factors which affect the sakes of the retailers whom they sell their product to

Desired Final State:
This will be leveraged by the product category team of the FMCG company to help the retailers increase their sales and get a better image, bolstering the long term relationship with the clients

Questions:
1) What are the internal and external factors which contribute to sales?
2) What is the metric to evaluate the factors affecting the sales?

Approach:
Followed the 6 stage framework of CRISP Data Mining process

Business understanding:

1) The sales vary from retailer to retailer. Also this is varied across product categories inside each retailer
2) It gets easy for the FMCG company to pitch strategies to improve the retailer sales along woth increase in their product sales

Data understanding

1) The data is a longitudinal. It has the UPC, month, year, Producct Group, Product Category, REtailer, Discount from different kind of promotions
2) The dataset consists of 1,000,000 instances ranging across multiple years. There are many redundant records for this analysis which are captured for relative performance metric calculations

Data Preperation:

1) Filtered out the redundant data for the analysis in focus. Aggregated the data at a year, month, week, retailer, product category level.
2) Added external factors like Fortune list randing of the retailer, number of stores the retialer has, the number of employees the retailer has

Modelling:

1) I Have used Linear Regression modelling
2) Have created a R Shiny application to predict the targets at various levels of business

Evaluation:
1) Have used the p-value and the r square value whihc is obtained for the models. As a standard Factors having p value of 0.05 and lesser are considered significant 
2) R square value helps to determine the strength of the model obtained. If the R square is really low, the results from the model are ignored

# Write more about p and R square values

Deployment:
1) The R shiny application can be used by deploying the same in the FMCG company. Multiple users can access if its on a cloud sharing platform like AWS or R server
2) It can also be automated so that on a monthly basis when the data changes, the predictions can be produced and used. We can connect the model to the platform from where the data is stored
