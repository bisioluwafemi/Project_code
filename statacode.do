import excel "C:\Users\DELL 7300\Downloads\company.xlsx", sheet("Sheet1") firstrow clear
(11 vars, 40 obs)


swilk EnvironmentalCostRecognition EnvironmentalCostRecognition Debt Equity NetIncome Assets CurrentRevenue Previousrevenue



gen log_ECR = log( EnvironmentalCostRecognition)

gen log_ED = log( EnvironmentalDisclosuresED)

gen log_netincome = log( NetIncome)


swilk log_ECR log_ED Debt Equity NetIncome Assets CurrentRevenue Previousrevenue

drop leverage
gen leverage = (Debt - Assets)*100
swilk leverage

gen Average_revenue = ( CurrentRevenue- Previousrevenue)/2

gen Total_revenue = CurrentRevenue + Previousrevenue

drop net_profit_margin
gen net_profit_margin = ( NetIncome - Total_revenue)*100
swilk net_profit_margin

drop Return_on_equity
gen Return_on_equity = ( NetIncome-Equity)*100
swilk Return_on_equity

drop growth
gen growth = (CurrentRevenue- Previousrevenue)*100
swilk growth

gen size = log(sum( Assets))
(4 missing values generated)

gen market_value = Equity + Debt

drop TobinQ
gen TobinQ = market_value - Equity
swilk TobinQ
use "C:\Users\DELL 7300\Downloads\comdata.dta"
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
reg net_profit_margin EnvironmentalCostRecognition EnvironmentalDisclosuresED Assets leverage growth
ksmirnov EnvironmentalCostRecognition = normal( EnvironmentalCostRecognition )
ksmirnov EnvironmentalDisclosuresED = normal( EnvironmentalDisclosuresED )
ksmirnov net_profit_margin = normal( net_profit_margin )
ksmirnov Return_on_equity = normal( Return_on_equity )
ksmirnov TobinQ = normal( TobinQ )
ksmirnov leverage = normal( leverage )
ksmirnov growth = normal( growth )
ksmirnov size = normal( size )
swilk EnvironmentalCostRecognition 
swilk EnvironmentalCostRecognition net_profit_margin Return_on_equity growth size TobinQ 
swilk log(EnvironmentalCostRecognition) log(net_profit_margin) log(Return_on_equity) log(growth) log(size) log(TobinQ) 
gen log_ECR = log( EnvironmentalCostRecognition)
gen log_ED = log( EnvironmentalDisclosuresED)
gen log_npm = log( net_profit_margin)
gen log_ROE = log( Return_on_equity)
gen log_growth = log( growth)
gen log_size = log( size )
gen log_TobinQ = log( TobinQ)
swilk log_ECR log_ED log_npm log_ROE log_growth log_size log_TobinQ
drop log_ECR log_ED log_npm log_ROE log_growth log_size log_TobinQ
gen log_ECR = sqrt(EnvironmentalCostRecognition)
gen log_ED = sqrt(EnvironmentalDisclosuresED)
gen log_npm = sqrt(net_profit_margin)
gen log_ROE = sqrt(Return_on_equity)
gen log_growth = sqrt(growth)
gen log_size = sqrt(size )
gen log_TobinQ = sqrt(TobinQ)
swilk log_ECR log_ED log_npm log_ROE log_growth log_size log_TobinQ
br
boxcox EnvironmentalCostRecognition 
gen ERD = ( EnvironmentalCostRecognition ^ 0.6939366 - 1) /  0.6939366
swilk ERD
import excel "C:\Users\DELL 7300\Downloads\company.xlsx", sheet("Sheet1") firstrow clear
swilk EnvironmentalCostRecognition 
 swilk EnvironmentalCostRecognition
swilk EnvironmentalDisclosuresED
swilk EnvironmentalCostRecognition net_profit_margin Return_on_equity growth size TobinQ 
swilk EnvironmentalCostRecognition EnvironmentalDisclosuresED Debt Equity NetIncome Assets
gen log_ECR = log( EnvironmentalCostRecognition)
swilk log_ECR
gen log_equity= log( Equity )
gen log_NetIncome = log( NetIncome)
swilk log_ECR log_equity log_NetIncome
gen leverage = sum( Debt)/sum( Assets)
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
swilk log_ECR leverage Average_revenue net_profit_margin Return_on_equity growth size EnvironmentalDisclosuresED Debt
swilk log_ECR leverage Average_revenue net_profit_margin growth size
gen log_leverage = log( leverage)
gen log_npm = log( net_profit_margin)
gen log_ROE = log( Return_on_equity)
gen log_growth = log( growth)
swilk log_ECR log_leverage log_npm log_ROE log_growth
gen sq_equity = sqrt( Equity)
swilk sq_equity
drop sq_equity log_equity log_leverage log_npm
swilk log_growth
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
swilk TobinQ
swilk EnvironmentalCostRecognition EnvironmentalDisclosuresED Debt Equity NetIncome Assets CurrentRevenue Previousrevenue
swilk log_ECR log_NetIncome
gen sqrt_netincome = sqrt( NetIncome)
swilk sqrt_netincome
gen Total_revenue = CurrentRevenue- Previousrevenue
swilk Total_revenue
swilk Average_revenue
swilk leverage
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
drop leverage
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
swilk leverage
gen log_leverage = log( leverage)
swilk log_leverage
swilk TobinQ
drop TobinQ
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
swilk TobinQ
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
do "C:\Users\DELL73~1\AppData\Local\Temp\STDf90_000000.tmp"
import excel "C:\Users\DELL 7300\Downloads\company.xlsx", sheet("Sheet1") clear
import excel "C:\Users\DELL 7300\Downloads\company.xlsx", sheet("Sheet1") firstrow clear
swilk EnvironmentalCostRecognition EnvironmentalCostRecognition Debt Equity NetIncome Assets CurrentRevenue Previousrevenue
gen log_ECR = log( EnvironmentalCostRecognition)
gen log_ED = log( EnvironmentalDisclosuresED)
swilk log_ECR log_ED
gen log_netincome = log( NetIncome)
swilk log_netincome
import excel "C:\Users\DELL 7300\Downloads\company.xlsx", sheet("Sheet1") firstrow clear
swilk leverage Average_revenue net_profit_margin Return_on_equity growth TobinQ
drop leverage
swilk leverage
swilk leverage growth TobinQ net_profit_margin Return_on_equity
swilk leverage growth net_profit_margin Return_on_equity TobinQ
reg TobinQ log_ECR log_ED Assets leverage growth
reg TobinQ log_ECR log_ED Assets growth
reg net_profit_margin log_ECR log_ED Assets leverage growth
reg Return_on_equity log_ECR log_ED Assets leverage growth
reg TobinQ log_ECR log_ED Assets growth
predict residuals, residuals
swilk residuals
reg TobinQ log_ECR log_ED Assets growth
reg net_profit_margin log_ECR log_ED Assets leverage growth
summarize EnvironmentalCostRecognition