replace  SingleHH = subinstr(SingleHH, " ", "8888", .)
destring SingleHH, replace

replace  QMarStatRes = subinstr(QMarStatRes, "V", "9", .)
destring QMarStatRes, replace

replace QEduRes = subinstr(QEduRes, " ", "8888", .)
replace QEduRes = subinstr(QEduRes, "V", "99", .)
destring QEduRes, replace

replace  QGadgetMP = subinstr(QGadgetMP, " ", "0", .)
replace  QGadgetMP = subinstr(QGadgetMP, "V", "9", .)
destring QGadgetMP, replace

replace  QGadgetPC = subinstr(QGadgetPC, " ", "0", .)
destring QGadgetPC, replace

replace  QGadgetPDA = subinstr(QGadgetPDA, " ", "0", .)
destring QGadgetPDA, replace

replace  QGadgetNone = subinstr(QGadgetNone, " ", "0", .)
destring QGadgetNone, replace

foreach VAR of varlist QCoresFam65Nursing  QLivSepFam65Nursing ///
					   QCoresOthersNursing QLivSepOthersNursing ///
					   QNoneNursing{
	replace  `VAR' = subinstr(`VAR', " ", "0", .)
	destring `VAR', replace
}

replace  QLivArrChild = subinstr(QLivArrChild, "V", "9", .)
replace  QLivArrChild = subinstr(QLivArrChild, " ", "8888", .)
destring QLivArrChild, replace

replace  QJobStat = subinstr(QJobStat, "V", "9", .)
replace  QJobStat = subinstr(QJobStat, " ", "8888", .)
destring QJobStat, replace

replace  QDsrWork = subinstr(QDsrWork, "V", "9", .)
replace  QDsrWork = subinstr(QDsrWork, " ", "8888", .)
destring QDsrWork, replace

replace  QEmpStat = subinstr(QEmpStat, "VV", "99", .)
replace  QEmpStat = subinstr(QEmpStat, " ",  "8888", .)
destring QEmpStat, replace

replace  QJobSize = subinstr(QJobSize, "V", "99", .)
replace  QJobSize = subinstr(QJobSize, " ", "8888", .)
destring QJobSize, replace

replace  QWorkHoursWeek = subinstr(QWorkHoursWeek, "V", "9", .)
replace  QWorkHoursWeek = subinstr(QWorkHoursWeek, " ", "8888", .)
destring QWorkHoursWeek, replace

replace  QCommuteTime = subinstr(QCommuteTime, "V", "9", .)
replace  QCommuteTime = subinstr(QCommuteTime, " ", "8888", .)
destring QCommuteTime, replace

replace  QJobHolidays = subinstr(QJobHolidays, "V", "9", .)
replace  QJobHolidays = subinstr(QJobHolidays, " ", "8888", .)
destring QJobHolidays, replace

foreach VAR of varlist QVacNewYear  QVacGW ///
					   QVacSummer   QVacOthers ///
					   QVacNone{
	replace  `VAR' = subinstr(`VAR', " ", "0", .)
	destring `VAR', replace
}

replace  QHouseType = subinstr(QHouseType, "V", "9", .)
destring QHouseType, replace

replace  QNofRoom = subinstr(QNofRoom, "V", "9", .)
destring QNofRoom, replace

replace  QPrivCar = subinstr(QPrivCar, "V", "9", .)
destring QPrivCar, replace

replace  QHHInc = subinstr(QHHInc, "VV", "99", .)
destring QHHInc, replace

foreach VAR of varlist QUnaccAssignment ///
                       QUnaccAssignmentSouse ///
                       QUnaccAssignmentParents ///
					   QUnaccAssignmentChild ///
					   QUnaccAssignmentOthers{
	replace  `VAR' = subinstr(`VAR', " ", "0", .)
	destring `VAR', replace
}

foreach VAR of varlist QHosp ///
 					   QHospSpouse ///
					   QHospParents ///
					   QHospChild ///
					   QHospOthers{
	replace  `VAR' = subinstr(`VAR', " ", "0", .)
	destring `VAR', replace
}

forval i = 1/6{
	replace  QRelHHpsnU10_`i' = subinstr(QRelHHpsnU10_`i',    " ", "8888", .)
	destring QRelHHpsnU10_`i', replace
	
	replace  QCAgeHHpsnU10_`i'   = subinstr(QCAgeHHpsnU10_`i',   " ", "8888", .)
	destring QCAgeHHpsnU10_`i', replace
	
	replace  QSchoolHHpsnU10_`i' = subinstr(QSchoolHHpsnU10_`i', " ", "8888", .)
	destring QSchoolHHpsnU10_`i', replace
}

replace  QNofHHpsnOver10 = subinstr(QNofHHpsnOver10, "  ", "8888", .)
destring QNofHHpsnOver10, replace

replace  QNofHHpsnUnder10 = subinstr(QNofHHpsnUnder10, "  ", "8888", .)
destring QNofHHpsnUnder10, replace

replace  KJob = subinstr(KJob, "VV", "99", .)
destring KJob, replace

replace  KLifeStage = subinstr(KLifeStage, "VV", "99", .)
destring KLifeStage, replace

replace  KHHType = subinstr(KHHType, "VV", "99", .)
destring KHHType, replace

replace  KDoubleInc = subinstr(KDoubleInc, "V",  "9", .)
replace  KDoubleInc = subinstr(KDoubleInc, " ",  "8888", .)
destring KDoubleInc, replace

replace  KWrkHoursWH4grp = subinstr(KWrkHoursWH4grp, " ",  "8888", .)
destring KWrkHoursWH4grp, replace

replace  KCAgeNatYg = subinstr(KCAgeNatYg, "  ", "8888", .)
destring KCAgeNatYg, replace

replace  KEduNatYg = subinstr(KEduNatYg, "  ", "8888", .)
destring KEduNatYg, replace

replace  KNatCAge6 = subinstr(KNatCAge6, " ", "8888", .)
destring KNatCAge6, replace

foreach VAR of varlist QDayNoteTrip ///
					   QDayNotePicnic ///
                       QDayNoteCeremony ///
					   QDayNoteBusinessTrip ///
					   QDayNoteResting ///
					   QDayNoteDayoff ///
					   QDayNoteOthers {
	replace  `VAR' = subinstr(`VAR', " ", "8888", .)
	destring `VAR', replace					   
}

replace  QWeather = subinstr(QWeather, "V", "9", .)
replace  QWeather = subinstr(QWeather, " ", "8888", .)
destring QWeather, replace

forval i = 1/96 {
	*replace QActType`i' = subinstr(QActType`i', " ",  "8888", .)
	
	replace  QTimeAlone`i' = subinstr(QTimeAlone`i', "V", "9", .)
	replace  QTimeAlone`i' = subinstr(QTimeAlone`i', " ", "8888", .)
	destring QTimeAlone`i', replace

	replace QTimeFamily`i' = subinstr(QTimeFamily`i', "V", "8888", .)

	replace QTimeColleague`i' = subinstr(QTimeColleague`i', "V", "8888", .)
	
	replace QTimeOthers`i' = subinstr(QTimeOthers`i', "V", "8888", .)
}

