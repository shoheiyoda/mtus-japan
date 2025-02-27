********************************************************************************
* 00_MasterDo.do
*	Creating MTUS variables using anonymized STULA data
********************************************************************************

********************************************************************************
* Set Working Directory
********************************************************************************
* select the directory where do-files are stored
cd "XXXX"

********************************************************************************
* Set paramters
********************************************************************************
local SurveyYear 2016       /* survey year: 1991, 1996, 2001, 2006, 2011, 2016 */
local RawCSVDir "XXXX"		/* local directory in which the original STULA data files are stored */
local OutDir    "XXXX"		/* local directory in which harmonized data will be stored */

********************************************************************************

include "01_ImportRawCSV.do"
include "02_JapanMTUS.do"
