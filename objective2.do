import excel "C:\Users\DELL 7300\Downloads\OBJ.xlsx", sheet("Sheet1") firstrow clear
egen mean_NX_by_COUNTRY = mean(NX), by(COUNTRY)
replace NX = mean_NX_by_COUNTRY if missing(NX)
egen mean_KA_by_COUNTRY = mean(KA), by(COUNTRY)
replace KA = mean_KA_by_COUNTRY if missing(KA)
egen mean_FDI_by_COUNTRY = mean(FDI), by(COUNTRY)
replace FDI = mean_FDI_by_COUNTRY if missing(FDI)
egen mean_ODA_by_COUNTRY = mean(ODA), by(COUNTRY)
replace ODA = mean_ODA_by_COUNTRY if missing(ODA)
egen mean_REM_by_COUNTRY = mean(REM), by(COUNTRY)
replace REM = mean_REM_by_COUNTRY if missing(REM)
egen mean_GDP_by_COUNTRY = mean(GDP), by(COUNTRY)
replace GDP = mean_GDP_by_COUNTRY if missing(GDP)
egen mean_POP_by_COUNTRY = mean(POP), by(COUNTRY)
replace POP = mean_POP_by_COUNTRY if missing(POP)
egen mean_INF_by_COUNTRY = mean(INF), by(COUNTRY)
replace INF = mean_INF_by_COUNTRY if missing(INF)
egen mean_EXC_by_COUNTRY = mean(EXC), by(COUNTRY)
replace EXC = mean_EXC_by_COUNTRY if missing( EXC)
encode COUNTRY, generate(country_num)
xtset country_num YEAR
summarize NX KA FDI ODA REM GDP POP INF EXC 
summarize NX KA FDI ODA REM GDP POP INF EXC,detail
sktest NX KA FDI ODA REM GDP POP INF EXC
correlate NX KA FDI ODA REM GDP POP INF EXC
xtreg NX KA FDI ODA REM GDP POP INF EXC, fe 
estimates store fe_model
xtreg NX NX KA FDI ODA REM GDP POP INF EXC, re 
estimates store re_model
hausman fe_model re_model

xtunitroot llc NX 
xtunitroot llc KA 
xtunitroot llc FDI 
xtunitroot llc ODA 
xtunitroot llc REM 
xtunitroot llc GDP 
xtunitroot llc POP 
xtunitroot llc INF 
xtunitroot llc EXC
xtunitroot fisher NX, dfuller lags(1) 
xtunitroot fisher KA, dfuller lags(1) 
xtunitroot fisher FDI, dfuller lags(1) 
xtunitroot fisher ODA, dfuller lags(1) 
xtunitroot fisher REM, dfuller lags(1) 
xtunitroot fisher GDP, dfuller lags(1) 
xtunitroot fisher POP, dfuller lags(1) 
xtunitroot fisher INF, dfuller lags(1) 
xtunitroot fisher EXC, dfuller lags(1) 
xtunitroot ips NX 
xtunitroot ips KA 
xtunitroot ips FDI 
xtunitroot ips ODA 
xtunitroot ips REM 
xtunitroot ips GDP 
xtunitroot ips POP 
xtunitroot ips INF 
xtunitroot ips EXC 
xtunitroot fisher NX, pperron lags(1) 
xtunitroot fisher KA, pperron lags(1) 
xtunitroot fisher FDI, pperron lags(1) 
xtunitroot fisher ODA, pperron lags(1) 
xtunitroot fisher REM, pperron lags(1) 
xtunitroot fisher GDP, pperron lags(1) 
xtunitroot fisher POP, pperron lags(1) 
xtunitroot fisher INF, pperron lags(1) 
xtunitroot fisher EXC, pperron lags(1)
xtcd NX
xtcd KA
xtcd FDI
xtcd ODA
xtcd REM
xtcd GDP
xtcd POP
xtcd INF
xtcd EXC
xtreg NX KA FDI ODA REM GDP POP INF EXC,fe
xttest2
xtcsd, pesaran abs
xtcointtest kao NX KA FDI ODA REM GDP POP INF EXC

 