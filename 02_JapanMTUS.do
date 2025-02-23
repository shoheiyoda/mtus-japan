********************************************************************************
* 02_JapanMTUS.do
* 	Create the MTUS harmonized variables
********************************************************************************

clear all

********************************************************************************
* Set Parameters
********************************************************************************
local JapanMTUS_Dir "02_JapanMTUS/"
local VarListMTUS   "88_VarListMUTS.do"

********************************************************************************
* create directories for outputs
local OutDirHAF "`OutDir'02_JapanMTUS/AggregateFiles/"
local OutDirHEF "`OutDir'02_JapanMTUS/EpisodeFiles/"

capture mkdir `OutDirHAF' 
capture mkdir `OutDirHEF'

* read the unharmonized variables
local QVarsDir "`OutDir'01_QVars/"
use `QVarsDir'QVarsSTULA_Ano`SurveyYear', clear

* create harmonized variables
include "`JapanMTUS_Dir'`SurveyYear'/JapanMTUS`SurveyYear'.do"

include `VarListMTUS'
keep  `Vars2Keep'
order `Vars2Keep'

save TempData, replace

* save data
**  Aggregate Files
drop act_short*
save `OutDirHAF'JapanMTUS_HAF_Ano`SurveyYear', replace	

** Episode Files
use TempData, clear
drop sleep-sick_jp
save `OutDirHEF'JapanMTUS_HEF_Ano`SurveyYear', replace	

* erase temporary data
erase TempData.dta
