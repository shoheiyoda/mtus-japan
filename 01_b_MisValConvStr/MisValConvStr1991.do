replace  QMarStatRes = subinstr(QMarStatRes, "V", "9", .)
destring QMarStatRes, replace


replace  QEduRes = subinstr(QEduRes, "V", "99", .)
destring QEduRes, replace


replace  QJobStat = subinstr(QJobStat, "V", "9", .)
destring QJobStat, replace


replace  QEmpStat = subinstr(QEmpStat, "V", "9", .)
replace  QEmpStat = subinstr(QEmpStat, " ", "8888", .)
destring QEmpStat, replace


replace  QJobSize = subinstr(QJobSize, "V", "9", .)
replace  QJobSize = subinstr(QJobSize, " ", "8888", .)
destring QJobSize, replace


replace  QWorkHoursWeek = subinstr(QWorkHoursWeek, "V", "9", .)
replace  QWorkHoursWeek = subinstr(QWorkHoursWeek, " ", "8888", .)
destring QWorkHoursWeek, replace


replace  QJobHolidays = subinstr(QJobHolidays, "V", "9", .)
replace  QJobHolidays = subinstr(QJobHolidays, " ", "8888", .)
destring QJobHolidays, replace


replace  QVac = subinstr(QVac, " ", "8888", .)
destring QVac, replace

forval i = 1/4{
	replace  QVacTim`i' = subinstr(QVacTim`i', "V", "9", .)
	replace  QVacTim`i' = subinstr(QVacTim`i', " ", "8888", .)
	destring QVacTim`i', replace

	replace  QVacPur`i' = subinstr(QVacPur`i', "V", "9", .)
	replace  QVacPur`i' = subinstr(QVacPur`i', "     ", "8888", .)
	destring QVacPur`i', replace
}

replace  QHouseType = subinstr(QHouseType, "V", "9", .)
destring QHouseType, replace


replace  QNofRoom = subinstr(QNofRoom, "V", "9", .)
destring QNofRoom, replace


replace  QPrivCar = subinstr(QPrivCar, "V", "9", .)
destring QPrivCar, replace


replace  QHHInc = subinstr(QHHInc, "VV", "99", .)
destring QHHInc, replace


replace  KSES = subinstr(KSES, "VV", "99", .)
replace  KSES = subinstr(KSES, "  ", "8888", .)
destring KSES, replace


replace  KDoubleInc = subinstr(KDoubleInc, "V",  "9", .)
replace  KDoubleInc = subinstr(KDoubleInc, " ",  "8888", .)
destring KDoubleInc, replace


replace  KCAgeNatYg = subinstr(KCAgeNatYg, " ", "8888", .)
destring KCAgeNatYg, replace
