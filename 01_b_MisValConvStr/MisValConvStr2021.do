replace  LinkKeyHH = subinstr(LinkKeyHH, "          ", "-8888", .)
destring LinkKeyHH, replace


replace  SingleHH = subinstr(SingleHH, " ", "8888", .)
destring SingleHH, replace


replace  QMarStatRes = subinstr(QMarStatRes, "V", "9", .)
destring QMarStatRes, replace

replace  QEduRes = subinstr(QEduRes, "  ", "8888", .)
replace  QEduRes = subinstr(QEduRes, "VV", "99", .)
destring QEduRes, replace


replace  QSubHealth = subinstr(QSubHealth, "V", "9", .)
destring QSubHealth, replace


replace  QChronicIllness = subinstr(QChronicIllness, " ", "8888", .)
replace  QChronicIllness = subinstr(QChronicIllness, "V", "9", .)
destring QChronicIllness, replace


replace  QDailyLifeLimitation = subinstr(QDailyLifeLimitation, " ", "8888", .)
replace  QDailyLifeLimitation = subinstr(QDailyLifeLimitation, "V", "9", .)
destring QDailyLifeLimitation, replace


replace  QReceiveCare_Home = subinstr(QReceiveCare_Home, " ", "8888", .)
replace  QReceiveCare_Home = subinstr(QReceiveCare_Home, "V", "9", .)
destring QReceiveCare_Home, replace


replace  QReceiveCare_NotHome = subinstr(QReceiveCare_NotHome, " ", "8888", .)
replace  QReceiveCare_NotHome = subinstr(QReceiveCare_NotHome, "V", "9", .)
destring QReceiveCare_NotHome, replace


replace  QReceiveCare_None = subinstr(QReceiveCare_None, " ", "8888", .)
replace  QReceiveCare_None = subinstr(QReceiveCare_None, "V", "9", .)
destring QReceiveCare_None, replace


foreach VAR of varlist QCoresFam65Nursing  QProxCoresidFam65Nursing  QLivSepFam65Nursing ///
					   QCoresOthersNursing QProxCoresidOthersNursing QLivSepOthersNursing ///
					   QNoneNursing{
	replace  `VAR' = subinstr(`VAR', " ", "0", .)
	replace  `VAR' = subinstr(`VAR', "V", "9", .)
	destring `VAR', replace
}


replace  QJobStat = subinstr(QJobStat, "V", "9", .)
replace  QJobStat = subinstr(QJobStat, " ", "8888", .)
destring QJobStat, replace


replace  QDsrWork = subinstr(QDsrWork, "V", "9", .)
replace  QDsrWork = subinstr(QDsrWork, " ", "8888", .)
destring QDsrWork, replace


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


replace  QAnnInc = subinstr(QAnnInc, "VV", "99", .)
replace  QAnnInc = subinstr(QAnnInc, "  ", "8888", .)
destring QAnnInc, replace


replace  QWorkHoursWeek = subinstr(QWorkHoursWeek, "V", "9", .)
replace  QWorkHoursWeek = subinstr(QWorkHoursWeek, " ", "8888", .)
destring QWorkHoursWeek, replace


replace  QDsrWorkHoursWeekEmp = subinstr(QDsrWorkHoursWeekEmp, "V", "99", .)
replace  QDsrWorkHoursWeekEmp = subinstr(QDsrWorkHoursWeekEmp, " ", "8888", .)
destring QDsrWorkHoursWeekEmp, replace


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
	replace  QRelHHpsnU10_`i' = subinstr(QRelHHpsnU10_`i', " ", "8888", .)
	destring QRelHHpsnU10_`i', replace
	
	replace  QCAgeHHpsnU10_`i'   = subinstr(QCAgeHHpsnU10_`i', " ", "8888", .)
	destring QCAgeHHpsnU10_`i', replace
	
	replace  QSchoolHHpsnU10_`i' = subinstr(QSchoolHHpsnU10_`i', " ", "8888", .)
	destring QSchoolHHpsnU10_`i', replace
	
	replace  QChildcareGrdParHHpsnU10_`i'   = subinstr(QChildcareGrdParHHpsnU10_`i', " ", "8888", .)
	destring QChildcareGrdParHHpsnU10_`i', replace
	
	replace  QChildcareNeighborHHpsnU10_`i' = subinstr(QChildcareNeighborHHpsnU10_`i', " ", "8888", .)
	destring QChildcareNeighborHHpsnU10_`i', replace
	
	replace  QChildcareOthersHHpsnU10_`i'   = subinstr(QChildcareOthersHHpsnU10_`i', " ", "8888", .)
	destring QChildcareOthersHHpsnU10_`i', replace
	
	replace  QChildcareNoneHHpsnU10_`i'     = subinstr(QChildcareNoneHHpsnU10_`i', " ", "8888", .)
	destring QChildcareNoneHHpsnU10_`i', replace
}


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


replace  KCAgeNatYg = subinstr(KCAgeNatYg, "  ",  "8888", .)
destring KCAgeNatYg, replace


replace  KEduNatYg = subinstr(KEduNatYg, "  ",  "8888", .)
destring KEduNatYg, replace


*replace  QDayWeek = subinstr(QDayWeek, " ",  "8888", .)
*destring QDayWeek, replace


replace  QDayOff = subinstr(QDayOff, " ", "8888", .)
destring QDayOff, replace


replace  QUseSmartphone = subinstr(QUseSmartphone, " ", "8888", .)
replace  QUseSmartphone = subinstr(QUseSmartphone, "V", "9", .)
destring QUseSmartphone, replace


replace  QTimeSmartphone = subinstr(QTimeSmartphone, " ", "8888", .)
replace  QTimeSmartphone = subinstr(QTimeSmartphone, "V", "9", .)
destring QTimeSmartphone, replace


forval i = 1/96 {
	*replace QActType`i' = subinstr(QActType`i', " ",  "8888", .)
	
	replace  QTimeAlone`i' = subinstr(QTimeAlone`i', "V", "9", .)
	replace  QTimeAlone`i' = subinstr(QTimeAlone`i', " ", "8888", .)
	destring QTimeAlone`i', replace

	replace QTimeFamily`i' = subinstr(QTimeFamily`i', "V", "8888", .)

	replace QTimeColleague`i' = subinstr(QTimeColleague`i', "V", "8888", .)
	
	replace QTimeOthers`i' = subinstr(QTimeOthers`i', "V", "8888", .)
	replace QTimeSmartphone`i' = subinstr(QTimeOthers`i', "V", "8888", .)
}
