# Japanese time-use data harmonization
These scripts harmonize the Japanese time-use data to match the Multinational Time Use Study (MTUS) format.

## Notes
- Funding: [GenTime](https://www.gentime-project.org/) (PI: [Man-Yee Kan](https://www.sociology.ox.ac.uk/people/man-yee-kan) (University of Oxford))
    - European Research Council (ERC) (grant number 771736)

- Author: Shohei Yoda (shohei.yoda@gmail.com)

## Data
- Survey on Time Use and Leisure Activities (STULA)
  - 社会生活基本調査(*Shakai Seikatsu Kihon Chosa*)
  - Anonymized data: 1991, 1996, 2001, 2006, 2011, and 2016

## Outline
### `01_ImportRawCSV.do`
- Import the raw CSV files to Stata
- Assign variable names
    - The raw CSV files do not contain variable names
  - Convert certain variables from string to numeric
    -  Some variables contain special strings representing missing values (e.g., "V", "VV", or a space " "), which need to be handled 

### `02_JapanMTUS.do`
- Harmonize selected variables
- Create the **Harmonized Aggregate Files (HAF)** and **Harmonized Episode Files (HEF)**
