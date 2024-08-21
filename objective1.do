import excel "C:\Users\DELL 7300\Downloads\Copy of Cap_Mob.xlsx", sheet("Sheet1") firstrow
egen mean_grossfixedcapital = mean( Grossfixedcapitalformation) if Country == "Angola"
replace Grossfixedcapitalformation = mean_grossfixedcapital if missing( Grossfixedcapitalformation )
egen mean_grossdomesticssavings = mean( GrossdomesticsavingsofGDP ) if Country == "Angola"
replace GrossdomesticsavingsofGDP = mean_grossdomesticssavings if missing( GrossdomesticsavingsofGDP )
br
egen mean_grossfixedcapital2 = mean( Grossfixedcapitalformation) if Country == "Nigeria"
replace Grossfixedcapitalformation = mean_grossfixedcapital2 if missing(Grossfixedcapitalformation)
egen mean_grossfixedcapital3 = mean( Grossfixedcapitalformation) if Country == "Guinea-Bissau"
replace Grossfixedcapitalformation = mean_grossfixedcapital3 if missing(Grossfixedcapitalformation)
egen mean_grossdomesticssavings3 = mean( GrossdomesticsavingsofGDP ) if Country == "Guinea-Bissau"
replace GrossdomesticsavingsofGDP = mean_grossdomesticssavings3 if missing( GrossdomesticsavingsofGDP )
encode Country, generate(Country_num)
list Country_num Year Grossfixedcapitalformation if missing( Grossfixedcapitalformation)
list Country_num Year GrossdomesticsavingsofGDP if missing( GrossdomesticsavingsofGDP )
xtset Country_num Year
summarize Grossfixedcapitalformation GrossdomesticsavingsofGDP
by Country, sort : summarize Grossfixedcapitalformation GrossdomesticsavingsofGDP
summarize Grossfixedcapitalformation GrossdomesticsavingsofGDP,detail
sktest Grossfixedcapitalformation GrossdomesticsavingsofGDP
correlate Grossfixedcapitalformation GrossdomesticsavingsofGDP
ssc install xtcd
ssc install xttest2
ssc install xtfisher
describe
rename Grossfixedcapitalformation GFCF
rename GrossdomesticsavingsofGDP GDS_GDP
xtcd GFCF
xtcd GDS_GDP
xttest2 GFCF
xttest2 GDS_GDP
xtfisher GFCF
xtfisher GDS_GDP
xtunitroot ips GFCF
xtunitroot ips GDS_GDP
xtunitroot llc GFCF
xtunitroot llc GDS_GDP
xtunitroot fisher GFCF, dfuller lags(1)
xtunitroot fisher GDS_GDP , dfuller lags(1)
xtunitroot fisher GDS_GDP , pperron lags(1)
xtunitroot fisher GFCF , pperron lags(1)
xtreg GFCF GDS_GDP,fe
estimates store fixed_model
xtreg GFCF GDS_GDP,re
estimates store random_model
hausman fixed_model random_model
xtreg GFCF GDS_GDP
estimates store pooled

