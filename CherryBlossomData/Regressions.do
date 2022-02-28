	
	
	
	{	
	clear
	clear matrix
	clear mata
	set more off
	cap log close
	version 15
	ssc install fre
	ssc install mvfiles
	//ssc install egenmore, replace
	//ssc install ereplace, replace
	set maxvar 20000
	
****SETTING GLOBALS****
//Adjust the year variable!

global folder "/Users/WilliamJamesonPattie_/Desktop/CherryBlossomData/" 

****LOG****
//log using "${log_folder}Log_`: di  %tdN-D-CY  daily("$S_DATE", "DMY")'", text replace
	}
	
	
	************
	**** DC ****
	************
	
	
	import delimited using "${folder}EVI_output/DC/MOD13A1-006-Statistics.csv", clear
	
	egen jan17 = noccur(date), string("01-17")
	keep if jan17 == 1
	
	gen year = 0
	
	egen y00 = noccur(date), string("2000")
	replace year = 2000 if y00 == 1
	egen y01 = noccur(date), string("2001")
	replace year = 2001 if y01 == 1
	egen y02 = noccur(date), string("2002")
	replace year = 2002 if y02 == 1
	egen y03 = noccur(date), string("2003")
	replace year = 2003 if y03 == 1
	egen y04 = noccur(date), string("2004")
	replace year = 2004 if y04 == 1
	egen y05 = noccur(date), string("2005")
	replace year = 2005 if y05 == 1
	egen y06 = noccur(date), string("2006")
	replace year = 2006 if y06 == 1
	egen y07 = noccur(date), string("2007")
	replace year = 2007 if y07 == 1
	egen y08 = noccur(date), string("2008")
	replace year = 2008 if y08 == 1
	egen y09 = noccur(date), string("2009")
	replace year = 2009 if y09 == 1
	egen y10 = noccur(date), string("2010")
	replace year = 2010 if y10 == 1
	egen y11 = noccur(date), string("2011")
	replace year = 2011 if y11 == 1
	egen y12 = noccur(date), string("2012")
	replace year = 2012 if y12 == 1
	egen y13 = noccur(date), string("2013")
	replace year = 2013 if y13 == 1
	egen y14 = noccur(date), string("2014")
	replace year = 2014 if y14 == 1
	egen y15 = noccur(date), string("2015")
	replace year = 2015 if y15 == 1
	egen y16 = noccur(date), string("2016")
	replace year = 2016 if y16 == 1
	egen y17 = noccur(date), string("2017")
	replace year = 2017 if y17 == 1
	egen y18 = noccur(date), string("2018")
	replace year = 2018 if y18 == 1
	egen y19 = noccur(date), string("2019")
	replace year = 2019 if y19 == 1
	egen y20 = noccur(date), string("2020")
	replace year = 2020 if y20 == 1
	egen y21 = noccur(date), string("2021")
	replace year = 2021 if y21 == 1
	egen y22 = noccur(date), string("2022")
	replace year = 2022 if y22 == 1
	drop y00-y22
	
	
	egen evi = noccur(dataset), string("EVI")
	keep if evi == 1
	drop evi
	save "${folder}DCmergedEVI", replace
	
	//Add the GDD data
	import delimited using "${folder}data/AGDD_dc.csv", clear
	merge 1:1 year using "${folder}DCmergedEVI", update
	drop _merge
	cap drop bloom_day
	save "${folder}DCmergedEVI", replace
	
	import delimited using "${folder}data/washingtondc.csv", clear
	merge 1:1 year using "${folder}DCmergedEVI", update
	drop _merge
	drop filename dataset aid minimum maximum upperquartile upper15iqr median lower15iqr lowerquartile jan17 standarddeviation variance range lat v3 alt bloom_date count date
	
	
	input
	"" 2023 . . .
	"" 2024 . . .
	"" 2025 . . .
	"" 2026 . . .
	"" 2027 . . .
	"" 2028 . . .
	"" 2029 . . .
	"" 2030 . . .
	"" 2031 . . .
	end
	
	
	
	reg mean year if year != 2011
	twoway (scatter mean year) (lfit mean year if year != 2011)
	predict mean_predicted if year >= 2023 //Predict new EVI's
	
	reg agdd year
	twoway (scatter agdd year) (lfit agdd year)
	predict agdd_predicted if year >= 2021 //Predict new GDD's
	
	reg bloom_doy mean agdd if year != 2011 //Then store new regression
	//twoway (scatter bloom_doy mean) (lfit bloom_doy mean if year != 2011)
	
	
	replace mean = mean_predicted if year > 2022
	replace agdd = agdd_predicted if year > 2020
	predict bloom_prediction 
	
	drop mean_predicted
	drop agdd_predicted
	
	save "${folder}DCmergedEVI", replace
	
	//Hand enter vancouver GDD from here: https://vancouver.weatherstats.ca/charts/gdd_10-monthly.html
	
	/**
	gen vancouverGDD = . //from march 1st
	replace 
	*/
	
	
	
	
	***************
	**** KYOTO ****
	***************
	
	
	import delimited using "${folder}EVI_output/Kyoto/MOD13A1-006-Statistics.csv", clear
	
	egen jan17 = noccur(date), string("01-17")
	keep if jan17 == 1
	
	gen year = 0
	
	egen y00 = noccur(date), string("2000")
	replace year = 2000 if y00 == 1
	egen y01 = noccur(date), string("2001")
	replace year = 2001 if y01 == 1
	egen y02 = noccur(date), string("2002")
	replace year = 2002 if y02 == 1
	egen y03 = noccur(date), string("2003")
	replace year = 2003 if y03 == 1
	egen y04 = noccur(date), string("2004")
	replace year = 2004 if y04 == 1
	egen y05 = noccur(date), string("2005")
	replace year = 2005 if y05 == 1
	egen y06 = noccur(date), string("2006")
	replace year = 2006 if y06 == 1
	egen y07 = noccur(date), string("2007")
	replace year = 2007 if y07 == 1
	egen y08 = noccur(date), string("2008")
	replace year = 2008 if y08 == 1
	egen y09 = noccur(date), string("2009")
	replace year = 2009 if y09 == 1
	egen y10 = noccur(date), string("2010")
	replace year = 2010 if y10 == 1
	egen y11 = noccur(date), string("2011")
	replace year = 2011 if y11 == 1
	egen y12 = noccur(date), string("2012")
	replace year = 2012 if y12 == 1
	egen y13 = noccur(date), string("2013")
	replace year = 2013 if y13 == 1
	egen y14 = noccur(date), string("2014")
	replace year = 2014 if y14 == 1
	egen y15 = noccur(date), string("2015")
	replace year = 2015 if y15 == 1
	egen y16 = noccur(date), string("2016")
	replace year = 2016 if y16 == 1
	egen y17 = noccur(date), string("2017")
	replace year = 2017 if y17 == 1
	egen y18 = noccur(date), string("2018")
	replace year = 2018 if y18 == 1
	egen y19 = noccur(date), string("2019")
	replace year = 2019 if y19 == 1
	egen y20 = noccur(date), string("2020")
	replace year = 2020 if y20 == 1
	egen y21 = noccur(date), string("2021")
	replace year = 2021 if y21 == 1
	egen y22 = noccur(date), string("2022")
	replace year = 2022 if y22 == 1
	drop y00-y22
	
	egen evi = noccur(dataset), string("EVI")
	keep if evi == 1
	drop evi
	save "${folder}KYOTOmergedEVI", replace
	
	import delimited using "${folder}data/kyoto.csv", clear
	merge 1:1 year using "${folder}KYOTOmergedEVI", update
	drop _merge
	drop filename dataset aid minimum maximum upperquartile upper15iqr median lower15iqr lowerquartile jan17 standarddeviation variance range lat v3 alt bloom_date count date
	
	reg bloom_doy mean
	twoway (scatter bloom_doy mean) (lfit bloom_doy mean)	
	
	input
	"" 2023 . . .
	"" 2024 . . .
	"" 2025 . . .
	"" 2026 . . .
	"" 2027 . . .
	"" 2028 . . .
	"" 2029 . . .
	"" 2030 . . .
	"" 2031 . . .
	end
	
	reg mean year
	twoway (scatter mean year) (lfit mean year)
	predict mean_predicted if year >= 2023 //Predict new EVI's
	
	reg bloom_doy mean if year //Then store new regression
	twoway (scatter bloom_doy mean) (lfit bloom_doy mean)
	
	replace mean = mean_predicted if year > 2022
	predict bloom_prediction 
	
	drop mean_predicted
	save "${folder}KYOTOmergedEVI", replace
	
	
	*****************
	**** LIESTAL ****
	*****************
	
	
	import delimited using "${folder}EVI_output/Liestal/MOD13A1-006-Statistics.csv", clear
	
	egen jan17 = noccur(date), string("01-17")
	keep if jan17 == 1
	
	gen year = 0
	
	egen y00 = noccur(date), string("2000")
	replace year = 2000 if y00 == 1
	egen y01 = noccur(date), string("2001")
	replace year = 2001 if y01 == 1
	egen y02 = noccur(date), string("2002")
	replace year = 2002 if y02 == 1
	egen y03 = noccur(date), string("2003")
	replace year = 2003 if y03 == 1
	egen y04 = noccur(date), string("2004")
	replace year = 2004 if y04 == 1
	egen y05 = noccur(date), string("2005")
	replace year = 2005 if y05 == 1
	egen y06 = noccur(date), string("2006")
	replace year = 2006 if y06 == 1
	egen y07 = noccur(date), string("2007")
	replace year = 2007 if y07 == 1
	egen y08 = noccur(date), string("2008")
	replace year = 2008 if y08 == 1
	egen y09 = noccur(date), string("2009")
	replace year = 2009 if y09 == 1
	egen y10 = noccur(date), string("2010")
	replace year = 2010 if y10 == 1
	egen y11 = noccur(date), string("2011")
	replace year = 2011 if y11 == 1
	egen y12 = noccur(date), string("2012")
	replace year = 2012 if y12 == 1
	egen y13 = noccur(date), string("2013")
	replace year = 2013 if y13 == 1
	egen y14 = noccur(date), string("2014")
	replace year = 2014 if y14 == 1
	egen y15 = noccur(date), string("2015")
	replace year = 2015 if y15 == 1
	egen y16 = noccur(date), string("2016")
	replace year = 2016 if y16 == 1
	egen y17 = noccur(date), string("2017")
	replace year = 2017 if y17 == 1
	egen y18 = noccur(date), string("2018")
	replace year = 2018 if y18 == 1
	egen y19 = noccur(date), string("2019")
	replace year = 2019 if y19 == 1
	egen y20 = noccur(date), string("2020")
	replace year = 2020 if y20 == 1
	egen y21 = noccur(date), string("2021")
	replace year = 2021 if y21 == 1
	egen y22 = noccur(date), string("2022")
	replace year = 2022 if y22 == 1
	drop y00-y22
	
	egen evi = noccur(dataset), string("EVI")
	keep if evi == 1
	drop evi
	save "${folder}LIESTALmergedEVI", replace
	
	import delimited using "${folder}data/liestal.csv", clear
	merge 1:1 year using "${folder}LIESTALmergedEVI", update
	drop _merge
	drop filename dataset aid minimum maximum upperquartile upper15iqr median lower15iqr lowerquartile jan17 standarddeviation variance range lat v3 alt bloom_date count date
	
	reg bloom_doy mean
	twoway (scatter bloom_doy mean) (lfit bloom_doy mean)
	
	input
	"" 2023 . . .
	"" 2024 . . .
	"" 2025 . . .
	"" 2026 . . .
	"" 2027 . . .
	"" 2028 . . .
	"" 2029 . . .
	"" 2030 . . .
	"" 2031 . . .
	end
	
	reg mean year
	twoway (scatter mean year) (lfit mean year)
	predict mean_predicted if year >= 2023 //Predict new EVI's
	
	reg bloom_doy mean //Then store new regression
	twoway (scatter bloom_doy mean) (lfit bloom_doy mean)
	
	replace mean = mean_predicted if year > 2022
	predict bloom_prediction 
	
	drop mean_predicted
	save "${folder}LIESTALmergedEVI", replace
	***************
	** Vancouver **
	***************
	import delimited using "${folder}EVI_output/Vancouver/MOD13A1-006-Statistics.csv", clear
	
	egen jan17 = noccur(date), string("01-17")
	keep if jan17 == 1
	
	gen year = 0
	
	egen y00 = noccur(date), string("2000")
	replace year = 2000 if y00 == 1
	egen y01 = noccur(date), string("2001")
	replace year = 2001 if y01 == 1
	egen y02 = noccur(date), string("2002")
	replace year = 2002 if y02 == 1
	egen y03 = noccur(date), string("2003")
	replace year = 2003 if y03 == 1
	egen y04 = noccur(date), string("2004")
	replace year = 2004 if y04 == 1
	egen y05 = noccur(date), string("2005")
	replace year = 2005 if y05 == 1
	egen y06 = noccur(date), string("2006")
	replace year = 2006 if y06 == 1
	egen y07 = noccur(date), string("2007")
	replace year = 2007 if y07 == 1
	egen y08 = noccur(date), string("2008")
	replace year = 2008 if y08 == 1
	egen y09 = noccur(date), string("2009")
	replace year = 2009 if y09 == 1
	egen y10 = noccur(date), string("2010")
	replace year = 2010 if y10 == 1
	egen y11 = noccur(date), string("2011")
	replace year = 2011 if y11 == 1
	egen y12 = noccur(date), string("2012")
	replace year = 2012 if y12 == 1
	egen y13 = noccur(date), string("2013")
	replace year = 2013 if y13 == 1
	egen y14 = noccur(date), string("2014")
	replace year = 2014 if y14 == 1
	egen y15 = noccur(date), string("2015")
	replace year = 2015 if y15 == 1
	egen y16 = noccur(date), string("2016")
	replace year = 2016 if y16 == 1
	egen y17 = noccur(date), string("2017")
	replace year = 2017 if y17 == 1
	egen y18 = noccur(date), string("2018")
	replace year = 2018 if y18 == 1
	egen y19 = noccur(date), string("2019")
	replace year = 2019 if y19 == 1
	egen y20 = noccur(date), string("2020")
	replace year = 2020 if y20 == 1
	egen y21 = noccur(date), string("2021")
	replace year = 2021 if y21 == 1
	egen y22 = noccur(date), string("2022")
	replace year = 2022 if y22 == 1
	drop y00-y22
	
	egen evi = noccur(dataset), string("EVI")
	keep if evi == 1
	drop evi
	save "${folder}VANCOUVERmergedEVI", replace
	
	gen gdd = . //bloom date
	gen bloomdate = .
	//gen year
	replace gdd = 0 if year > 2011 & year < 2022
	replace gdd = 60 if year == 2016
	replace gdd = 15 if year == 2018
	replace gdd = 18 if year == 2020
	replace gdd = 23 if year == 2021
	replace bloomdate = 92 if year == 2016
	replace bloomdate = 88 if year == 2018
	replace bloomdate = 93 if year == 2020
	replace bloomdate = 89 if year == 2021
	
	//reg bloomdate gdd
	
	//replace gdd = gdd_predicted if year >= 2022
	
	keep year bloomdate gdd mean
	
	input
	. 2023 . .
	. 2024 . .
	. 2025 . .
	. 2026 . .
	. 2027 . .
	. 2028 . .
	. 2029 . .
	. 2030 . .
	. 2031 . .
	end
	
	
	reg mean year
	twoway (scatter mean year) (lfit mean year if year != 2011)
	predict mean_predicted if year >= 2023 //Predict new EVI's
	
	reg gdd year
	twoway (scatter gdd year) (lfit gdd year)
	predict gdd_predicted if year >= 2022 //Predict new GDD's
	
	reg bloomdate mean gdd //Then store new regression
	//twoway (scatter bloom_doy mean) (lfit bloom_doy mean if year != 2011)
	
	
	replace mean = mean_predicted if year >= 2023
	replace gdd = gdd_predicted if year >= 2022
	predict bloom_prediction 
	
	drop mean_predicted
	drop gdd_predicted
	
	save "${folder}VANCOUVERmergedEVI", replace
	
	
	/**
	2016 April 1st
	2018 March 29
	2020 April 2nd
	2021 March 30th
	*/
	
	/**
	use "${folder}LIESTALmergedEVI", clear
	
	append using "KYOTOmergedEVI"
	append using "DCmergedEVI"
	
	reg bloom_doy mean if inrange(mean, 0.1, 1) //Takes out outlier
	twoway (scatter bloom_doy mean) (lfit bloom_doy mean if inrange(mean, 0.1, 1))
	*/
	