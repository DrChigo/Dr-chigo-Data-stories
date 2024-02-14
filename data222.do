clear all
set more off
import excel "C:\Users\RENET\OneDrive\Desktop\data222\data222.xlsx", sheet("Sheet1") firstrow clear
xtset Countries Time
label variable FPI "Food Price Index"
label variable INF "Inflation rate %"
label variable ECR "Exchange rate Local currecncy to USD"
label variable FoodGDPsupply "contribution of agriculture to GDP USD"
label variable INT "Interest rate %"
label variable GDP "Gross Domestic Product"
label variable Temp "Temperature degree Celsius"
label variable Conflicts "Number of violent/political Conflicts"
label variable UKRusian "Period UK-Rusian (War=1, No war=0)"
describe
summarize FPI INF ECR FoodGDPsupply INT GDP Temp Conflicts UKRusian
correlate FPI INF ECR FoodGDPsupply INT GDP Temp Conflicts UKRusian
tsreport
tsset
tsfill, full
xtunitroot hadri FPI, trend
xtunitroot hadri INF, trend
xtunitroot hadri ECR, trend
xtunitroot hadri FoodGDPsupply, trend
xtunitroot hadri INT, trend
xtunitroot hadri GDP, trend
xtunitroot hadri Temp, trend
xtunitroot hadri Conflicts, trend
xtunitroot hadri UKRusian, trend
 xtreg FPI INF ECR FoodGDPsupply INT GDP Temp Conflicts UKRusian, re
 estimate store re
 xtreg FPI INF ECR FoodGDPsupply INT GDP Temp Conflicts UKRusian, fe
 estimate store fe
 hausman re fe
quietly reg FPI INF ECR FoodGDPsupply INT GDP Temp Conflicts UKRusian
test INF ECR FoodGDPsupply INT GDP Temp Conflicts UKRusian
