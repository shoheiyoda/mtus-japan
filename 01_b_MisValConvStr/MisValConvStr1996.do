replace  SingleHH = subinstr(SingleHH, " ", "8888", .)
destring SingleHH, replace


replace  QMarStatRes = subinstr(QMarStatRes, "V", "9", .)
destring QMarStatRes, replace


replace  QEduRes = subinstr(QEduRes, "  ", "8888", .)
replace  QEduRes = subinstr(QEduRes, "VV", "99", .)
destring QEduRes, replace


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


replace  QEmpStatX = subinstr(QEmpStatX, "V", "9", .)
replace  QEmpStatX = subinstr(QEmpStatX, " ", "8888", .)
destring QEmpStatX, replace


replace  QEmpStatY = subinstr(QEmpStatY, "V", "9", .)
replace  QEmpStatY = subinstr(QEmpStatY, " ", "8888", .)
destring QEmpStatY, replace


replace  QJobSize = subinstr(QJobSize, "V", "9", .)
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


replace  KSES = subinstr(KSES, "VV", "99", .)
replace  KSES = subinstr(KSES, "  ", "8888", .)
destring KSES, replace


replace  KDoubleInc = subinstr(KDoubleInc, "V",  "9", .)
replace  KDoubleInc = subinstr(KDoubleInc, " ",  "8888", .)
destring KDoubleInc, replace


replace  KEduNatYg = subinstr(KEduNatYg, "  ", "8888", .)
destring KEduNatYg, replace


replace  KCAgeNatYg = subinstr(KCAgeNatYg, "  ", "8888", .)
destring KCAgeNatYg, replace


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

