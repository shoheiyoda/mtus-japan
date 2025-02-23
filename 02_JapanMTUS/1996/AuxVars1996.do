********************************************************************************
* Create identifiers of coresident parent
********************************************************************************
* father of the head of the household
gen HeadFather = .
gen is_target = 1 if  QSex == 1 & QRelRes == 6
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH)
replace HeadFather = TargetID if inlist(QRelRes, 1, 9)
drop is_target TargetID

* mother of the head of the household
gen HeadMother = .
gen is_target = 1 if QSex == 2 & QRelRes == 6
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace HeadMother = TargetID if inlist(QRelRes, 1, 9)
drop is_target TargetID

* father of the spouse of the head of the household
gen HeadSpoFather = .
gen is_target = 1 if QSex == 1 & QRelRes == 7
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace HeadSpoFather = TargetID if QRelRes == 2
drop is_target TargetID

* mother of the spouse of the head of the household
gen HeadSpoMother = .
gen is_target = 1 if QSex == 2 & QRelRes == 7 
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace HeadSpoMother = TargetID if QRelRes == 2
drop is_target TargetID

* father of the child of the head of the household
gen HeadChildFather = .
gen is_target = 1 if QSex == 1 & inlist(QRelRes, 1, 2)
egen TargetID = max(SerialNumHHMem*is_target), by(SerialNumHH) 
replace HeadChildFather = TargetID if QRelRes == 3
drop is_target TargetID

* mother of the child of the head of the household
gen HeadChildMother = .
gen is_target = 1 if QSex == 2 & inlist(QRelRes, 1, 2)
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace HeadChildMother = TargetID if QRelRes == 3
drop is_target TargetID

* father of the grandchild of the head of the household
gen HeadGrandchildFather = .
gen is_target = 1 if QSex == 1 & inlist(QRelRes, 3, 4)
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace HeadGrandchildFather = TargetID if QRelRes == 5
drop is_target TargetID

* mother of the grandchild of the head of the household
gen HeadGrandchildMother = .
gen is_target = 1 if QSex == 2 & inlist(QRelRes, 3, 4)
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace HeadGrandchildMother = TargetID if QRelRes == 5
drop is_target TargetID

* father of the parent of the head of the household
gen HeadParentFather = .
gen is_target = 1 if QSex == 1 & QRelRes == 8
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace HeadParentFather = TargetID if QRelRes == 6
drop is_target TargetID

* mother of the parent of the head of the household
gen HeadParentMother = .
gen is_target = 1 if QSex == 2 & QRelRes == 8
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace HeadParentMother = TargetID if QRelRes == 6
drop is_target TargetID

* Identifier of diarist's father
gen FatherID = .
foreach var of varlist HeadFather HeadSpoFather HeadChildFather HeadGrandchildFather HeadParentFather {
	replace FatherID = `var' if `var' != .
}
la var FatherID "SerialNumHHMem of the co-resident father"

* Identifier of diarist's mother
gen MotherID = .
foreach var of varlist HeadMother HeadSpoMother HeadChildMother HeadGrandchildMother HeadParentMother {
	replace MotherID = `var' if `var' != .
}
la var MotherID "SerialNumHHMem of the co-resident mother"

gen OwnParent = 0
foreach var of varlist HeadFather           HeadMother ///
					   HeadSpoFather        HeadSpoMother ///
					   HeadChildFather      HeadChildMother ///
					   HeadGrandchildFather HeadGrandchildMother ///
					   HeadParentFather     HeadParentMother {
	replace OwnParent = 1 if `var' != .
}

drop Head*

********************************************************************************
* Create identifiers of coresident spouse
********************************************************************************
gen HeadSpo = .
gen is_target = 1  if  QRelRes == 2 
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace HeadSpo = TargetID  if  QRelRes == 1 
drop is_target TargetID

gen HeadSpoSpo = .
gen is_target = 1  if  QRelRes == 1 
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace HeadSpoSpo = TargetID  if  QRelRes == 2 
drop is_target TargetID

gen ChildSpo = .
gen is_target = 1  if  QRelRes == 4 
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace ChildSpo = TargetID  if  QRelRes == 3 
drop is_target TargetID

gen ChildSpoSpo = .
gen is_target = 1  if  QRelRes == 3 
egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
replace ChildSpoSpo = TargetID  if  QRelRes == 4 
drop is_target TargetID

	save TempFull, replace
	
	* Cases where the couple relationship cannot be identified.
	use TempInd, clear
	bysort SerialNumHH: egen NofChild    = sum(QRelRes == 3)
	bysort SerialNumHH: egen NofChildSpo = sum(QRelRes == 4)
	
	gen     flag = 1 if inrange(NofChild, 1, 98) & inrange(NofChildSpo, 1, 98) & NofChild != NofChildSpo /* e.g., There are two co-resident children, only one of which is married */
    replace flag = 2 if inrange(NofChild, 2, 98) & inrange(NofChildSpo, 2, 98) & NofChild == NofChildSpo /* e.g., There are two co-resident children, both of which are married */ 

	keep SerialNumHH SerialNumHHMem flag
		
	merge 1:m SerialNumHH SerialNumHHMem using TempFull
	
	replace ChildSpo    = . if inlist(flag, 1, 2)
	replace ChildSpoSpo = . if inlist(flag, 1, 2)

gen HeadParSpo = .
sum SerialNumHHMem

forvalues i = 1/`r(max)' { 
     gen is_target = 1  if  SerialNumHHMem != `i' & QRelRes == 6 
     egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
	 replace HeadParSpo = TargetID  if  QRelRes == 6 & SerialNumHHMem == `i'
     drop is_target TargetID
 } 

gen HeadSpoParSpo = .
sum SerialNumHHMem

forvalues i = 1/`r(max)' { 
     gen is_target = 1  if  SerialNumHHMem != `i' & QRelRes == 7 
     egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
	 replace HeadSpoParSpo = TargetID  if  QRelRes == 7 & SerialNumHHMem == `i'
     drop is_target TargetID
 } 
 
// MaleGrandchildSpo and FemaleGrandchildSpo are probably misspecified. These two variables cannot be speficied in STULA
/*
gen MaleGrandchildSpo = .
sum SerialNumHHMem

forvalues i = 1/`r(max)' { 
     gen is_target = 1  if  SerialNumHHMem != `i' & QRelRes == 5 & QMarStatRes == 2 & QSex == 2
     egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
	 replace MaleGrandchildSpo = TargetID  if  QRelRes == 5 & SerialNumHHMem == `i' & QSex == 1
     drop is_target TargetID
 } 
 
gen FemaleGrandchildSpo = .
sum SerialNumHHMem

forvalues i = 1/`r(max)' { 
     gen is_target = 1  if  SerialNumHHMem != `i' & QRelRes == 5 & QMarStatRes == 2 & QSex == 1
     egen TargetID = max(SerialNumHHMem * is_target), by(SerialNumHH) 
	 replace FemaleGrandchildSpo = TargetID  if  QRelRes == 5 & SerialNumHHMem == `i' & QSex == 2
     drop is_target TargetID
 }  
*/
 
********************************************************************************
* Age of youngest child in household
********************************************************************************
* household youngest (measured only for couples with children)
egen    CAgeNatYg7Grp = min(KCAgeNatYg), by(SerialNumHH)
gen     CAgeNatYg = .
replace CAgeNatYg = 0  if  CAgeNatYg7Grp == 0
replace CAgeNatYg = 1  if  CAgeNatYg7Grp == 1
replace CAgeNatYg = 3  if  CAgeNatYg7Grp == 2
replace CAgeNatYg = 4  if  CAgeNatYg7Grp == 3
replace CAgeNatYg = 6  if  CAgeNatYg7Grp == 4
replace CAgeNatYg = 6  if  CAgeNatYg7Grp == 5
replace CAgeNatYg = 9  if  CAgeNatYg7Grp == 6
replace CAgeNatYg = 10 if  CAgeNatYg7Grp == 7 /* 7: 10+ */

* household youngest 10 or older
egen   CAgeYgOv10 = min(age), by(SerialNumHH)
la var CAgeYgOv10 "minimum age of household members over 10"

/*
* number of children under 10 in a household
if (inlist(`SurveyYear', 2006)){
	egen hsh_und10 = min(hsh_under10_head), by(SerialNumHH)
}

* age of the youngest child in the household
** under 10 can use specific age. Over 10 or use midpoints for 10-14 =>12 and 15-19 =>17
gen     agekid2 = .
replace agekid2 = hsh_youngestund10
replace agekid2 = 12 if minage_ov10 == 1 & hsh_youngestund10 == .
replace agekid2 = 17 if minage_ov10 == 2 & hsh_youngestund10 == .
*/
