********************************************************************************
* COUNTRY: 
* Country of survey - HEF HAF HCF
********************************************************************************
gen country = "JP"


********************************************************************************
* SURVEY: 
* Year the survey began - HEF HAF only
********************************************************************************
gen survey = 2021


********************************************************************************
* SWAVE: 
* Longitudinal study wave marker - HEF HAF only
********************************************************************************
gen swave = 0


********************************************************************************
* MSAMP: 
* Multiple samples using the same diary instrument - HEF HAF only
********************************************************************************
gen msamp = 0


********************************************************************************
* HLDID: 
* Household identifier - HEF HAF HCF
********************************************************************************
gen hldid = SerialNumHH


********************************************************************************
* PERSID: 
* Person/diarist identifier - HEF HAF HCF
********************************************************************************
gen persid = SerialNumHHMem


********************************************************************************
* ID: 
* Diary identifier - HEF HAF HCF
********************************************************************************
gen id = QFstSndDay

********************************************************************************
* SEX: 
* Sex - HEF HAF HCF
********************************************************************************
gen     sex = 1 if QSex == 1
replace sex = 2 if QSex == 2


********************************************************************************
* AGE: 
* Age - HEF HAF HCF
********************************************************************************
gen     age =  .
replace age = 12 if QCAgeRes ==  1
replace age = 17 if QCAgeRes ==  2
replace age = 22 if QCAgeRes ==  3
replace age = 27 if QCAgeRes ==  4
replace age = 32 if QCAgeRes ==  5
replace age = 37 if QCAgeRes ==  6
replace age = 42 if QCAgeRes ==  7
replace age = 47 if QCAgeRes ==  8
replace age = 52 if QCAgeRes ==  9
replace age = 57 if QCAgeRes == 10
replace age = 62 if QCAgeRes == 11
replace age = 67 if QCAgeRes == 12
replace age = 72 if QCAgeRes == 13
replace age = 77 if QCAgeRes == 14
replace age = 82 if QCAgeRes == 15
replace age = 87 if QCAgeRes == 16
replace age = 92 if QCAgeRes == 17 /* 17:90+ */

* created continuus midpoints for comparability

********************************************************************************
* Auxiliary variables
********************************************************************************
save TempFull, replace /* diary-level data */

bysort SerialNumHH SerialNumHHMem: gen ObsID = _n
keep if ObsID == 1

save TempInd, replace /* individual-level data */

use TempFull, clear
include "02_JapanMTUS/2021/AuxVars2021.do"

********************************************************************************
* PARNTID1: 
* Person identifier of 1st parent of diarist - HEF HAF only
********************************************************************************
egen    parntid1 = rowmin(FatherID MotherID)
replace parntid1 = -7  if  parntid1 == .
replace parntid1 = -9  if  KHHType == 19


********************************************************************************
* PARNTID2: 
* Person identifier of 2nd parent of diarist - HEF HAF only
********************************************************************************
egen    parntid2 = rowmax(FatherID MotherID)
replace parntid2 = -7  if  parntid2 == .
replace parntid2 = -7  if  parntid1 == parntid2
replace parntid2 = -9  if  KHHType == 19


********************************************************************************
* PARTID: 
* Person identifier of spouse or partner - HEF HAF only
********************************************************************************

gen partid = .

foreach VAR of varlist HeadSpo HeadSpoSpo ChildSpo ChildSpoSpo HeadParSpo HeadSpoParSpo {
	replace partid = `VAR'  if  `VAR' != .
}

replace partid = -9  if  KHHType == 19
replace partid = -7  if  partid == .


********************************************************************************
* DAY: 
* Day of week diary kept - HEF HAF HCF
********************************************************************************
gen     day = .
replace day = 1 if QDayWeek == 7
replace day = 2 if QDayWeek == 1
replace day = 3 if QDayWeek == 2
replace day = 4 if QDayWeek == 3
replace day = 5 if QDayWeek == 4
replace day = 6 if QDayWeek == 5
replace day = 7 if QDayWeek == 6

********************************************************************************
* CDAY: 
* Calendar day diary kept - HEF only
********************************************************************************


********************************************************************************
* MONTH: 
* Month diary kept - HEF HAF HCF
********************************************************************************
gen month = 10

********************************************************************************
* YEAR: 
* Year diary kept - HEF HAF HCF
********************************************************************************
gen year = 2021

********************************************************************************
* DIARY: 
* Diary order - HEF HAF only
********************************************************************************
gen diary = QFstSndDay

********************************************************************************
* NOWGHT: 
* Marker of insufficient cases with no propwt - HEF HAF only
********************************************************************************
gen nowght = 0

********************************************************************************
* HHLDSIZE: 
* Number of people in household - HAF HCF only
********************************************************************************
gen  hhldsize_temp = QNofHHpsnOver10 + QNofHHpsnUnder10
egen hhldsize = min(hhldsize_temp), by(SerialNumHH)


********************************************************************************
* HHTYPE: 
* Household type - HAF only
********************************************************************************
gen     hhtype = 4
replace hhtype = 1  if   inlist(KHHType, 19)
replace hhtype = 2  if   inlist(KHHType, 1, 2)
replace hhtype = 3  if  inrange(KHHType, 3,15)

* Q: No missing values?


********************************************************************************
* NCHILD: 
* Number of children under 18 in household - HAF HCF only
********************************************************************************
* The anonymized STULA data only allow us to create a variable for the number of children under 20 or under 15 because the diarist's age is recorded in 5-year intervals.


* Note: number of children under 20 rather than under 18.

* # of HH members under 10
egen NofHHpsnUnder10 = min(QNofHHpsnUnder10), by(SerialNumHH)

* # of HH members aged 10-19
gen is_age10to20 = 1  if inrange(QCAgeRes, 1, 2)
bysort SerialNumHH SerialNumHHMem: replace is_age10to20 = . if _n != 1 /* keep only the 1st obs within diarist */

egen NofHHpsn_age10to20 = total(is_age10to20), by(SerialNumHH)

* # of children under 20 in household
gen nchild = NofHHpsnUnder10 + NofHHpsn_age10to20

drop NofHHpsnUnder10 is_age10to20 NofHHpsn_age10to20


********************************************************************************
* AGEKID2: 
* Age of youngest child in household - HAF only
********************************************************************************
gen     agekid2 = .
replace agekid2 = CAgeYgOv10 if  CAgeYgOv10 < 20 /* could include HH members aged 19 and 20 */
replace agekid2 = CAgeYgU10  if  CAgeYgU10 != .


********************************************************************************
* AGEKIDX: 
* Age of youngest child in household (including adult children) - HAF HCF only
********************************************************************************

******* WIP ********
gen agekidx = .
******* WIP ********


********************************************************************************
* INCORIG: 
* Original household income - HAF only
********************************************************************************
gen     incorig = .
replace incorig = QHHInc

********************************************************************************
* INCOME: 
* Total household income - grouped - HAF only
********************************************************************************
* generate a continuous income variable for calculating quartiles
gen     Income_cont =    .
replace Income_cont =   50 if QHHInc ==  1
replace Income_cont =  150 if QHHInc ==  2
replace Income_cont =  250 if QHHInc ==  3
replace Income_cont =  350 if QHHInc ==  4
replace Income_cont =  450 if QHHInc ==  5
replace Income_cont =  550 if QHHInc ==  6
replace Income_cont =  650 if QHHInc ==  7
replace Income_cont =  750 if QHHInc ==  8
replace Income_cont =  850 if QHHInc ==  9
replace Income_cont =  950 if QHHInc == 10
replace Income_cont = 1250 if QHHInc == 11
replace Income_cont = 1750 if QHHInc == 12

* generate variable labelling income quartiles
xtile quartile_inc = Income_cont, nquantiles(4)

* total household income - grouped
gen     income = .
replace income = 1 if inlist(quartile_inc, 1)
replace income = 2 if inlist(quartile_inc, 2, 3)
replace income = 3 if inlist(quartile_inc, 4)

********************************************************************************
* OWNHOME: 
* Whether household owns or rents home - HAF only
********************************************************************************
gen ownhome =  .


********************************************************************************
* URBAN: 
* Urban or rural household - HAF only
********************************************************************************
gen urban = ThreeMajorUrbanArea
* This variable is not collected in the STULA surveys


********************************************************************************
* COMPUTER: 
* Does household have a computer - HAF only
********************************************************************************
gen computer = .


********************************************************************************
* VEHICLE: 
* Does household have a private vehicle - HAF only
********************************************************************************
gen vehicle = .


********************************************************************************
* FAMSTAT: 
* Individual level family status - HAF only
********************************************************************************
gen     famstat = .
replace famstat = 0 if inrange(age, 18, 39) & agekid2 > 17
replace famstat = 1 if inrange(age, 18, 99) & agekid2 < 5
replace famstat = 2 if inrange(age, 18, 99) & inrange(agekid2, 5, 17)
replace famstat = 3 if inrange(age, 40, 99) & agekid2 > 17
replace famstat = 4 if age < 18 & parntid1 != .
replace famstat = 5 if age < 18 & parntid1 == .

********************************************************************************
* SINGPAR:
* Whether diarist is a single parent - HAF only
********************************************************************************
* Note: Single-father households are excluded from the anonymized STULA dataset

gen singpar = 0

* single-mother households w/o other adults
replace singpar = 1  if  KHHType == 17 & QRelRes == 1

* single-mother households w/ other adults (e.g., coresident parent(s))
*	      Grandparent(G1)    Parent(G2)	     Child(G3)
* Case1   Head of HH         Child           Grandchild
* Case2   Parent             Head of HH      Child

bysort SerialNumHH: egen have_spouse         = max(QRelRes == 2)
bysort SerialNumHH: egen have_child          = max(QRelRes == 3)
bysort SerialNumHH: egen have_child_u20      = max(QRelRes == 3 & inlist(QCAgeRes, 1, 2)) /* child under 20 */
bysort SerialNumHH: egen have_childsp        = max(QRelRes == 4)
bysort SerialNumHH: egen have_grandchild_u20 = max(QRelRes == 5 & inlist(QCAgeRes, 1, 2)) /* grandchild under 20 */
bysort SerialNumHH: egen have_parent         = max(QRelRes == 6)

gen     singpar_case1 = 0
replace singpar_case1 = 1  if (QRelRes == 3 & have_child == 1 & have_childsp != 1 & have_grandchild_u20 == 1)

gen     singpar_case2 = 0
replace singpar_case2 = 1  if (QRelRes == 1 & have_spouse != 1 & have_parent == 1 & have_grandchild_u20 == 1)

replace singpar = 1  if  singpar_case1 == 1
replace singpar = 1  if  singpar_case1 == 2

********************************************************************************
* RELREFP: 
* Relation to household reference person - HAF only
********************************************************************************
gen     relrefp =  .
replace relrefp =  1 if        QRelRes ==  1
replace relrefp =  2 if        QRelRes ==  2
replace relrefp =  3 if        QRelRes ==  3
replace relrefp =  4 if        QRelRes ==  6
replace relrefp =  5 if        QRelRes ==  9
replace relrefp =  6 if        QRelRes ==  4
replace relrefp =  7 if        QRelRes ==  7
replace relrefp =  9 if inlist(QRelRes, 5, 8)
replace relrefp = 10 if        QRelRes == 10


********************************************************************************
* CIVSTAT: 
* Is diarist in a couple? - HAF HCF onl
********************************************************************************
gen     civstat = .
replace civstat = 1 if        QMarStatRes == 2
replace civstat = 2 if inlist(QMarStatRes, 1, 3)


********************************************************************************
* COHAB: 
* Respondent is cohabiting - HAF only
********************************************************************************
gen cohab = .


********************************************************************************
* CITIZEN: 
* Whether diarist is a citizen of the country - HAF only
********************************************************************************
gen citizen = .


********************************************************************************
* EMPSTAT: 
* Employment status - HAF HCF only
********************************************************************************
gen     empstat =  .
replace empstat =  1 if        QEmpStat == 1
replace empstat =  2 if inlist(QEmpStat, 2, 3)
replace empstat =  3 if inlist(QEmpStat, 4, 5, 6, 7, 8, 9, 10 ,11 ,12)
replace empstat =  4 if        QEmpStat == .
replace empstat = -9 if        QEmpStat == 99	


********************************************************************************
* EMP: 
* In paid work - HAF only
********************************************************************************
gen     emp = .
replace emp = 0 if QEmpStat == .
replace emp = 1 if QEmpStat != .


********************************************************************************
* UNEMP: 
* Unemployed - HAF only
********************************************************************************
gen     unemp = .
replace unemp = 1 if QEmpStat != .
replace unemp = 0 if QEmpStat == .


********************************************************************************
* STUDENT: 
* Whether diarist is a student - HAF only
********************************************************************************
gen     student = .
replace student = 0 if inlist(QJobStat, 1, 2, 4, 6)
replace student = 1 if inlist(QJobStat, 3, 5) 


********************************************************************************
* RETIRED: 
* Whether diarist has retired - HAF only
********************************************************************************
gen retired = .


********************************************************************************
* EMPSP: 
* Employment status of spouse/partner - HAF only
********************************************************************************
save TempFull, replace

bysort SerialNumHH SerialNumHHMem: gen ObsID = _n
keep if ObsID == 1

keep  hldid persid empstat partid
order hldid persid empstat partid
sort  hldid persid empstat partid

drop if inlist(partid, -7, -9)

reshape wide empstat, i(hldid partid) j(persid)

egen empsp = rowmin(empstat*)

rename partid persid
keep hldid persid empsp

merge 1:m hldid persid using TempFull, nogen

replace empsp = -7  if  partid == -7
replace empsp = -9  if  partid == -9

********************************************************************************
* WORKHRS: 
* Paid work hours last week including overtime - HAF HCF only
********************************************************************************
* convert to continuous using top boundaries
* a bit problematic as over time in japan you get some more detailed categories

gen     wrkhrs =  .
replace wrkhrs = 14 if QWorkHoursWeek == 1
replace wrkhrs = 29 if QWorkHoursWeek == 2
replace wrkhrs = 34 if QWorkHoursWeek == 3
replace wrkhrs = 39 if QWorkHoursWeek == 4
replace wrkhrs = 48 if QWorkHoursWeek == 5
replace wrkhrs = 59 if QWorkHoursWeek == 6
replace wrkhrs = 65 if QWorkHoursWeek == 7
replace wrkhrs = -8 if QWorkHoursWeek == 9

*****************************
* Note: how to code "8:unfixed work hours(e.g., discretionary work)"
*****************************

********************************************************************************
* EMPINCLM: 
* Original monthly employment income - HAF only
********************************************************************************
gen empinclm = .

********************************************************************************
* OCCUPO: 
* Original Occupation - HAF only
********************************************************************************
gen occupo = KJob

********************************************************************************
* ISCO1: 
* ISCO 2008 1-Digit Occupation - HAF only
********************************************************************************
gen     isco1 =  .
replace isco1 =  1 if KJob == 1
replace isco1 =  2 if KJob == 2
replace isco1 =  4 if KJob == 3
replace isco1 =  5 if inlist(KJob, 4, 5, 6)
replace isco1 =  6 if KJob == 7
replace isco1 =  8 if inlist(KJob, 9)
replace isco1 =  9 if inlist(KJob, 8, 10, 11) 
replace isco1 = -9 if KJob == 12

* 8:生産工程従事者
* 10:建設・採掘従事者
* 11: 運搬・清掃・包装等従事者

********************************************************************************
* SECTOR: 
* Sector of employment - HAF only
********************************************************************************
gen sector = .


********************************************************************************
* EDUCA: 
* Educational level-original study code - HAF only
********************************************************************************
gen educa = QEduRes

********************************************************************************
* EDCAT:
* Harmonised highest level of education
********************************************************************************
gen     edcat = .
replace edcat =  1 if inlist(QEduRes, 1, 2, 3, 10)
replace edcat =  2 if inlist(QEduRes, 11)
replace edcat =  3 if inlist(QEduRes, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15, 16, 17)
replace edcat = -9 if inlist(QEduRes, 99)


********************************************************************************
* RUSHED: 
* Whether diarist generally feels rushed - HAF only
********************************************************************************
gen rushed = .


********************************************************************************
* HEALTH: 
* Diarist's general health - HAF only
********************************************************************************
gen     health = .
replace health = 0 if inlist(QSubHealth, 4, 5)
replace health = 1 if inlist(QSubHealth, 3)
replace health = 2 if inlist(QSubHealth, 2)
replace health = 3 if inlist(QSubHealth, 1)

********************************************************************************
* CARER: 
* Diarist looks after an adult or child with a disability - HAF only
********************************************************************************
gen carer = .


********************************************************************************
* DISAB: 
* Diarist has disability / limiting health condition - HAF only
********************************************************************************
gen disab = .


********************************************************************************
* OCOMBWT:
* Original weight (population & day preferred, or whatever original weight is available if not combined)
********************************************************************************
gen ocombwt = KWeight


********************************************************************************
* PROPWT:
* Proposed weight (population & day combined weight rescaled if needed)
********************************************************************************
gen propwt = .
// needs to be consructed for full mtus


********************************************************************************
* 25 activities for each episode
********************************************************************************
* Aggregate
gen sleep    = QSleepTotal
gen eatdrink = QMealTotal
gen selfcare = QPersonalCareTotal
gen paidwork = QWorkTotal
gen educatn  = QSchoolWorkTotal + QStudyTotal
gen foodprep = .
gen cleanetc = QHousekeepingTotal
gen maintain = .
gen shopserv = QShoppingTotal
gen garden   = .
gen petcare  = .
gen eldcare  = QNursingTotal
gen pkidcare = QChildcareTotal
gen ikidcare = .
gen religion = .
gen volorgwk = QSocialActTotal
gen commute  = QCommuteTotal
gen travel   = QTravelTotal
gen sportex  = QSportsTotal
gen TVradio  = QTVRadioNewsMagTotal
gen read     = .
gen compint  = .
gen goout    = .
gen leisure  = QLeisureTotal + QRestingTotal + QSocialLifeTotal + QMedTreatTotal
gen missing  = QOthersTotal

* Episode
forvalues i = 1/96{
	gen     act_short`i' =  .
	replace act_short`i' =  1  if  inlist(QActType`i', 1)
	replace act_short`i' =  2  if  inlist(QActType`i', 3)
	replace act_short`i' =  3  if  inlist(QActType`i', 2)
	replace act_short`i' =  4  if  inlist(QActType`i', 5)	
	replace act_short`i' =  5  if  inlist(QActType`i', 6, 14)		
*	replace act_short`i' =  6
	replace act_short`i' =  7  if  inlist(QActType`i', 7)
*	replace act_short`i' =  8	
	replace act_short`i' =  9  if  inlist(QActType`i', 10)
*	replace act_short`i' = 10	
*	replace act_short`i' = 11	
	replace act_short`i' = 12  if  inlist(QActType`i', 8)
	replace act_short`i' = 13  if  inlist(QActType`i', 9)
*	replace act_short`i' = 14
*	replace act_short`i' = 15	
	replace act_short`i' = 16  if  inlist(QActType`i', 17)
	replace act_short`i' = 17  if  inlist(QActType`i', 4)
	replace act_short`i' = 18  if  inlist(QActType`i', 11)
	replace act_short`i' = 19  if  inlist(QActType`i', 16)
	replace act_short`i' = 20  if  inlist(QActType`i', 12)
*	replace act_short`i' = 21
*	replace act_short`i' = 22
*	replace act_short`i' = 23
	replace act_short`i' = 24  if  inlist(QActType`i', 13, 15, 18, 19)
	replace act_short`i' = 25  if  inlist(QActType`i', 20)
}

lab def Lab_act25 ///
	 1 "Sleep" ///
	 2 "Eatdrink" ///
	 3 "Selfcare" ///
	 4 "Paidwork" ///
	 5 "Education" ///
	 6 "Foodprep" ///
	 7 "Cleanetc" ///
	 8 "Maintain" ///
	 9 "Shopserv" ///
	10 "Garden" ///
	11 "Petcare" ///
	12 "Eldcare" ///
	13 "Pkidcare" ///
	14 "Ikidcare" ///
	15 "Religion" ///
	16 "Volorgwk" ///
	17 "Commute" ///
	18 "Travel" ///
	19 "Sportex" ///
	20 "TVradio" ///
	21 "Read" ///
	22 "Compint" ///
	23 "Goout" ///
	24 "Leisure" ///
	25 "Missing"

lab val act_short* Lab_act25
		
		
********************************************************************************
* sick_jp:
* The original activity variable for "medical treatment and recuperation"
********************************************************************************
gen sick_jp = QMedTreatTotal
	
	
********************************************************************************
* Remove temporary data
********************************************************************************
erase TempFull.dta
erase TempInd.dta
