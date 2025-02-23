replace  SingleHH = subinstr(SingleHH, " ", "8888", .)
destring SingleHH, replace


replace  QMarStatRes = subinstr(QMarStatRes, "V", "9", .)
destring QMarStatRes, replace

replace  QEduRes = subinstr(QEduRes, "  ", "8888", .)
replace  QEduRes = subinstr(QEduRes, "V",  "99", .)
destring QEduRes, replace


replace  QSubHealth = subinstr(QSubHealth, " ", "9", .)
destring QSubHealth, replace


foreach VAR of varlist QCoresFam65Nursing  QProxCoresidFam65Nursing  QLivSepFam65Nursing ///
					   QCoresOthersNursing QProxCoresidOthersNursing QLivSepOthersNursing ///
					   QNoneNursing{
	replace  `VAR' = subinstr(`VAR', " ", "0", .)
	destring `VAR', replace
}


replace  QJobStat = subinstr(QJobStat, "V", "9", .)
replace  QJobStat = subinstr(QJobStat, " ", "8888", .)
destring QJobStat, replace


replace  QDsrWork = subinstr(QDsrWork, "V", "9", .)
replace  QDsrWork = subinstr(QDsrWork, " ", "8888", .)
destring QDsrWork, replace


replace  QDsrWorkHoursWeekUnemp = subinstr(QDsrWorkHoursWeekUnemp, "V", "9", .)
replace  QDsrWorkHoursWeekUnemp = subinstr(QDsrWorkHoursWeekUnemp, " ", "8888", .)
destring QDsrWorkHoursWeekUnemp, replace


replace  QEmpStat = subinstr(QEmpStat, "VV",  "99", .)
replace  QEmpStat = subinstr(QEmpStat, "  ",  "8888", .)
destring QEmpStat, replace


replace  QEmpFulltimeFlex = subinstr(QEmpFulltimeFlex, "V", "99", .)
replace  QEmpFulltimeFlex = subinstr(QEmpFulltimeFlex, " ", "8888", .)
destring QEmpFulltimeFlex, replace


replace  QNofPaidLeaveTaken = subinstr(QNofPaidLeaveTaken, "V", "99", .)
replace  QNofPaidLeaveTaken = subinstr(QNofPaidLeaveTaken, " ", "8888", .)
destring QNofPaidLeaveTaken, replace


replace  KJob = subinstr(KJob, "  ", "8888", .)
destring KJob, replace


replace  QJobSize = subinstr(QJobSize, "V", "99", .)
replace  QJobSize = subinstr(QJobSize, " ", "8888", .)
destring QJobSize, replace


replace  QWorkHoursWeek = subinstr(QWorkHoursWeek, "V", "9", .)
replace  QWorkHoursWeek = subinstr(QWorkHoursWeek, " ", "8888", .)
destring QWorkHoursWeek, replace


replace  QDsrWorkHoursWeekEmp = subinstr(QDsrWorkHoursWeekEmp, "V", "99", .)
replace  QDsrWorkHoursWeekEmp = subinstr(QDsrWorkHoursWeekEmp, " ", "8888", .)
destring QDsrWorkHoursWeekEmp, replace


replace  QAnnInc = subinstr(QAnnInc, "V",  "99", .)
replace  QAnnInc = subinstr(QAnnInc, "  ", "8888", .)
destring QAnnInc, replace


replace  QHouseType = subinstr(QHouseType, "V", "9", .)
destring QHouseType, replace


replace  QPrivCar = subinstr(QPrivCar, "V", "9", .)
destring QPrivCar, replace


replace  QHHInc = subinstr(QHHInc, "VV", "99", .)
destring QHHInc, replace


foreach VAR of varlist QUnaccAssignment  ///
                       QUnaccAssignmentSpouse ///
					   QUnaccAssignmentParent ///
					   QUnaccAssignmentChild ///
					   QUnaccAssignmentOthers{
	replace  `VAR' = subinstr(`VAR', " ", "0", .)
	destring `VAR', replace
}


foreach VAR of varlist QHosp  ///
                       QHospSpouse ///
					   QHospParent ///
					   QHospChild ///
					   QHospOthers{
	replace `VAR' = subinstr(`VAR', " ", "0", .)
	destring `VAR', replace
}


forval i = 1/6{
	replace  QRelHHpsnU10_`i' = subinstr(QRelHHpsnU10_`i',    " ", "8888", .)
	destring QRelHHpsnU10_`i', replace
	
	replace  QCAgeHHpsnU10_`i'   = subinstr(QCAgeHHpsnU10_`i',   " ", "8888", .)
	destring QCAgeHHpsnU10_`i', replace
	
	replace  QSchoolHHpsnU10_`i' = subinstr(QSchoolHHpsnU10_`i', " ", "8888", .)
	destring QSchoolHHpsnU10_`i', replace
	
	replace  QChildcareGrdParHHpsnU10_`i'   = subinstr(QChildcareGrdParHHpsnU10_`i',   " ", "8888", .)
	destring QChildcareGrdParHHpsnU10_`i', replace
	
	replace  QChildcareNeighborHHpsnU10_`i' = subinstr(QChildcareNeighborHHpsnU10_`i', " ", "8888", .)
	destring QChildcareNeighborHHpsnU10_`i', replace
	
	replace  QChildcareOthersHHpsnU10_`i'   = subinstr(QChildcareOthersHHpsnU10_`i',   " ", "8888", .)
	destring QChildcareOthersHHpsnU10_`i', replace
	
	replace  QChildcareNoneHHpsnU10_`i'     = subinstr(QChildcareNoneHHpsnU10_`i',     " ", "8888", .)
	destring QChildcareNoneHHpsnU10_`i', replace
}


replace  QNofHHpsnOver10 = subinstr(QNofHHpsnOver10, "  ", "8888", .)
destring QNofHHpsnOver10, replace


replace  QNofHHpsnUnder10 = subinstr(QNofHHpsnUnder10, "  ", "8888", .)
destring QNofHHpsnUnder10, replace


replace  KLifeStage = subinstr(KLifeStage, "VV", "99", .)
destring KLifeStage, replace


replace  KHHType = subinstr(KHHType, " ", "99", .)
destring KHHType, replace


replace  KDoubleInc = subinstr(KDoubleInc, "V", "9", .)
replace  KDoubleInc = subinstr(KDoubleInc, " ", "8888", .)
destring KDoubleInc, replace


replace  KWrkHoursWH4grp = subinstr(KWrkHoursWH4grp, " ",  "8888", .)
destring KWrkHoursWH4grp, replace


replace  QHaveChild = subinstr(QHaveChild, " ",  "8888", .)
destring QHaveChild, replace


replace  QHaveChildU6 = subinstr(QHaveChildU6, " ",  "8888", .)
destring QHaveChildU6, replace


replace  QNofChildU6 = subinstr(QNofChildU6, " ",  "8888", .)
destring QNofChildU6, replace


replace  QEduChildU6 = subinstr(QEduChildU6, " ",  "8888", .)
destring QEduChildU6, replace


replace  KCAgeNatYg = subinstr(KCAgeNatYg, " ",  "8888", .)
destring KCAgeNatYg, replace


replace  KEduNatYg = subinstr(KEduNatYg, " ",  "8888", .)
destring KEduNatYg, replace

replace  QWeather = subinstr(QWeather, "V", "9", .)
replace  QWeather = subinstr(QWeather, " ", "8888", .)
destring QWeather, replace


forval i = 1/96 {
	*replace QActType`i' = subinstr(QActType`i', " ",  "8888", .)
	
	replace  QTimeAlone`i' = subinstr(QTimeAlone`i', "V", "9", .)
	replace  QTimeAlone`i' = subinstr(QTimeAlone`i', " ", "8888", .)
	destring QTimeAlone`i', replace

	*replace QTimeFamily`i' = subinstr(QTimeFamily`i', "V", "8888", .)

	*replace QTimeColleague`i' = subinstr(QTimeColleague`i', "V", "8888", .)
	
	*replace QTimeOthers`i' = subinstr(QTimeOthers`i', "V", "8888", .)
		
	replace  QCompUse`i' = subinstr(QCompUse`i', " ",  "8888", .)
	destring QCompUse`i', replace

	replace  QCompUseShopping`i' = subinstr(QCompUseShopping`i', "V",  "9", .)
	replace  QCompUseShopping`i' = subinstr(QCompUseShopping`i', " ",  "8888", .)
	destring QCompUseShopping`i', replace

	replace  QCompUseLeisure`i' = subinstr(QCompUseLeisure`i', " ",  "8888", .)
	destring QCompUseLeisure`i', replace

	replace  QCompUseCom`i' = subinstr(QCompUseCom`i', " ",  "8888", .)
	destring QCompUseCom`i', replace
		
	replace  QCompUseComFam`i' = subinstr(QCompUseComFam`i', " ",  "8888", .)
	destring QCompUseComFam`i', replace
			
	replace  QCompUseComFrnd`i' = subinstr(QCompUseComFrnd`i', " ",  "8888", .)
	destring QCompUseComFrnd`i', replace

	replace  QCompUseComOthers`i' = subinstr(QCompUseComOthers`i', " ",  "8888", .)
	destring QCompUseComOthers`i', replace
	
	replace  QCompUseOthers`i' = subinstr(QCompUseOthers`i', " ",  "8888", .)
	destring QCompUseOthers`i', replace
}


foreach i in S1 S2 S3 S4 S5 S6 S7 S8 {
	replace  QActType`i' = subinstr(QActType`i', " ",  "8888", .)
	destring QActType`i', replace
	
	replace  QTimeAlone`i' = subinstr(QTimeAlone`i', "V", "9", .)
	replace  QTimeAlone`i' = subinstr(QTimeAlone`i', " ", "8888", .)
	destring QTimeAlone`i', replace
	
	replace  QTimeFamily`i' = subinstr(QTimeFamily`i', "V", "8888", .)
	destring QTimeFamily`i', replace

	replace  QTimeColleague`i' = subinstr(QTimeColleague`i', "V", "8888", .)
	destring QTimeColleague`i', replace
	
	replace  QTimeOthers`i' = subinstr(QTimeOthers`i', "V", "8888", .)
	destring QTimeOthers`i', replace
		
	replace  QCompUse`i' = subinstr(QCompUse`i', " ",  "8888", .)
	destring QCompUse`i', replace

	replace  QCompUseShopping`i' = subinstr(QCompUseShopping`i', " ",  "8888", .)
	destring QCompUseShopping`i', replace

	*replace QCompUseLeisure`i' = subinstr(QCompUseLeisure`i', " ",  "8888", .)

	*replace QCompUseCom`i' = subinstr(QCompUseCom`i', " ",  "8888", .)
		
	*replace QCompUseComFam`i' = subinstr(QCompUseComFam`i', " ",  "8888", .)
			
	*replace QCompUseComFrnd`i' = subinstr(QCompUseComFrnd`i', " ",  "8888", .)

	*replace QCompUseComOthers`i' = subinstr(QCompUseComOthers`i', " ",  "8888", .)
	
	*replace QCompUseOthers`i' = subinstr(QCompUseOthers`i', " ",  "8888", .)
}


replace  QDayOff = subinstr(QDayOff, " ", "8888", .)
destring QDayOff, replace

