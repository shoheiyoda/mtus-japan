********************************************************************************
* 01_ImportRawCSV.do
* 	Import the raw STULA csv files to Stata
********************************************************************************

clear all

********************************************************************************
* Set Parameters
********************************************************************************
local VarNameDir       "01_a_QVarsList/"
local MisValConvStrDir "01_b_MisValConvStr/"

********************************************************************************
* Set variable names
local TargetVarNames "`VarNameDir'QVars`SurveyYear'.do"
include `TargetVarNames'

* Read CSV
local TargetCSV "`RawCSVDir'`SurveyYear'shakai_J.csv"
import delimited `ListQVars' using `TargetCSV'

* Modify the raw data
*  - replace special characters (e.g., "V") with an integer
*  - convert the variable type, from string to numeric

include "`MisValConvStrDir'MisValConvStr`SurveyYear'.do"

qui ds *, has(type numeric)
foreach var of varlist `=r(varlist)' {
	recode `var' (8888 = .) 
}

* save data
local TargetOutDir "`OutDir'01_QVars/"
capture mkdir `TargetOutDir' /* create a directory for outputs */
save `TargetOutDir'QVarsSTULA_Ano`SurveyYear', replace
