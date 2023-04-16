******* Korean early industrialization **********

clear 
clear matrix 
set more off



global root         = "D:/research/LU_Wenyuan/keju" // Mac 
global dofiles      = "$root/dofile"
global logfiles     = "$root/logfile"
global data         = "$root/data"
global temp_data    = "$root/temp_data"
global tables       = "$root/tables"

log using "$logfiles/koreankeju2.log",text replace


****** Caculation of key variable ratio *****************

use "$data/literacy_replicate.dta", clear

gen manu_ratio = manufature / total_job

gen manu_ratio_normal = 100 * manu_ratio

label var manu_ratio_normal   "Manufacture employment ratio"

*************** mining ratio*********************
gen mining_ratio = mining/total_job 

gen mining_ratio_normal = 100 * mining_ratio

label var mining_ratio_normal "Mining employment ratio"

**********transportaiton ratio **********
gen transport_ratio = transportation / total_job

gen transport_ratio_normal = 100 * transport_ratio

label var transport_ratio_normal  "Transportation employment ratio" 


**********commerice ratio ***************** 
gen commerce_ratio = commerce/total_job

gen commerce_ratio_normal = 100 * commerce_ratio

label var commerce_ratio_normal "Commerce employment ratio"


save "$temp_data/new_kejudata.dta", replace 


******* 

use "$temp_data/new_kejudata.dta"

label var development                "Non-agricultural employment ratio"
label var kor_lit_rate               "Korean literacy rate"
label var jap_lit_rate               "Japanese literacy rate"
label var school_normal              "No. of public school per 1,000"
label var mungua_normal              "No. of mungua per 1,000"
label var ten_ratio                  "Land tenancy ratio"
label var pop_den                    "Population density"
label var dist2seoul_km              "Distance to Seoul (km)"
label var soil_mean                  "Soil acidity"
label var soil_mean2                 "Soil acidity, square"
label var yangban1                   "Yangban share(1909)"
label var soil_var                   "Soild acidity, variance"

label var district	                 "District name"
label var district_joseon            "District name in Joseon"
label var population_total	         "Total population"
label var male_total	             "Male population"
label var female_total	             "Female population"
label var population_j	             "Japanese population"
label var male_j	                 "Japanese male population"
label var female_j	                 "Japanese female population"
label var population_k	             "Korean population"
label var male_k	                 "Korean male population"
label var female_k	                 "Korean female population"
label var literacy_both	             "Population can speak both Japanese and Korean"
label var literacy_both_male         "Male population who can speak both Japanese and Korean"
label var literacy_both_female       "female population who can speak both Japanese and Korean"
label var literacy_both_genderrate	 "Gender rate for who can speak both Japanese and Korean"
label var literacy_both_j	         "Japanese population who can speak both Japanese and Korean"
label var literacy_both_j_male       "Japanese male population who can speak both Japanese and Korean"
label var literacy_both_j_female	 "Japanese female population who can speak both Japanese and Korean"
label var literacy_both_j_genderrate "Japanese gender rate for who can speak both Japanese and Korean"
label var literacy_both_k	         "Korean population who can speak both Japanese and Korean"
label var literacy_both_k_male	     "Korean male population who can speak both Japanese and Korean"
label var literacy_both_k_female	 "Korean female population who can speak both Japanese and Korean"
label var literacy_both_k_genderrate "Korean gender rate for who can speak both Japanese and Korean"
label var literacy_japan	         "Population who can speak Japanese"
label var literacy_japan_male	     "male population who can speak Japanese"
label var literacy_japan_female	     "female population who can speak Japanese"
label var literacy_japan_genderrate  "Gender rate for who can speak Japanese"
label var literacy_japan_j	         "Japanese population who can speak Japanese"
label var literacy_japan_j_male	     "Japanese male population who can speak Japanese"
label var literacy_japan_j_female	 "Japanese female population who can speak Japanese"
label var literacy_japan_j_genderrate "Japanese gender rate for who can speak Japanese"
label var literacy_japan_k            "Korean population who can speak Japanese"
label var literacy_japan_k_male	      "Korean male population who can speak Japanese"
label var literacy_japan_k_female	  "Korean female population who can speak Japanese"
label var literacy_japan_k_genderrate "Korean gender rate for who can speak Japanese"
label var literacy_korean	          "Population who can speak Korean"
label var literacy_korean_male	      "male population who can speak Korean"
label var literacy_korean_female	  "female population who can speak Korean"
label var literacy_korean_genderrate  "gender rate for who can speak Korean"
label var literacy_korean_j	          "Japanese population who can speak Korean"
label var literacy_korean_j_male	  "Japanese male population who can speak Korean"
label var literacy_korean_j_female	  "Japanese female population who can speak Korean"
label var literacy_korean_j_genderrate "Japanese gender rate for who can speak Korean"
label var literacy_korean_k	           "Korean population who can speak Korean"
label var literacy_korean_k_male	   "Korean male population who can speak Korean"
label var literacy_korean_k_female	   "Korean female population who can speak Korean"
label var literacy_korean_k_genderrate	"Korean gender rate for who can speak Korean"


*****provin label and district label *****
*** province name **** 

label define prov_id 101 "Gyeonggi—do" 102 "Gangwon-do" 103  "Chungcheongbuk-do" 104 "Chungcheongnam-do" ///
                     105 "Jeollabuk-do" 106 "Jeollanam-do" 107 "Gyeongsangbuk-do" 108 "Gyeongsangnm-do" ///
					 109 "Hwanghae-do" 110 "Phyonganbuk-do" 111 "Phyongannam-do" 112 "Hamgyongbuk-do" ///
					 113 "Hamgyeongnam-do"
					 
label values id_prov prov_id


**** id distict 
label define district_name 10101 "경성부" 10102 "인천부" 10103 	"개성부" 10104 "고양군" 10105 "광주군" 10106 "양주군" ///
                           10107 "연천군" 10108 "포천군" 10109 	"가평군" 10110 "양평군" 10111 "여주군" 10112 "이천군" ///
						   10113 "용인군" 10114 "안성군" 10115 	"진위군" 10116 "수원군" 10117 "시흥군" 10118 "부천군" ///
						   10119 "김포군" 10120 "강화군" 10121 	"파주군" 10122 "장단군" 10123 "개풍군" ///
						   10201 "춘천군" 10202 "인제군" 10203 	"양구군" 10204 "회양군" 10205 "통천군" 10206 "고성군" ///
						   10207 "양양군" 10208 "강릉군" 10209 	"삼척군" 10210 "울진군" 10211 "정선군" 10212 "평창군" ///
						   10213 "영월군" 10214 "원주군" 10215 	"횡성군" 10216 "홍천군" 10217 "화천군" 10218 "김화군" ///
						   10219 "철원군" 10120 "강화군" 10121 	"파주군" 10122 "장단군" 10123 "개풍군" 10201 "춘천군" ///
						   10202 "인제군" 10203 "양구군" 10204 	"회양군" 10205 "통천군" 10206 "고성군" 10207 "양양군" ///
						   10208 "강릉군" 10209 "삼척군" 10210 	"울진군" 10211 "정선군" 10212 "평창군" 10213 "영월군" ///
						   10214 "원주군" 10215 "횡성군" 10216 	"홍천군" 10217 "화천군" 10218 "김화군" 10219 "철원군" ///
						   10220 "평강군" 10221 "이천군" ///
						   10301 "청주군" 10302 "보은군" 10303 "옥천군" 10304 "영동군" 10305 "진천군" 10306 "괴산군" ///
						   10307 "음성군" 10308 "충주군" 10309	"제천군" 10310 "단양군" ///
						   10401 "공주군" 10402 "연기군" 10403 	"대전군" 10404 "논산군" 10405 "부여군" 10406 "서천군" ///
						   10407 "보령군" 10408 "청양군" 10409 	"홍성군" 10410 "예산군" 10411 "서산군" 10412 "당진군" ///
						   10413 "아산군" 10414 "천안군" ///
						   10501 "군산부" 10502 "전주군" 10503 	"진안군" 10504 "금산군" 10505 "무주군" 10506 "장수군" ///
						   10507 "임실군" 10508 "남원군" 10509 	"순창군" 10510 "정읍군" 10511 "고창군" 10512 "부안군" ///
						   10513 "김제군" 10514 "옥구군" 10515 	"익산군" ///
						   10601 "목포부" 10602 "광주군" ///
						   10603 "담양군" 10604 "곡성군" 10605 "구례군"	10606 "광양군"	10607 "여수군"	10608 "순천군" ///
						   10609 "고흥군"	10610 "보성군"	10611 "화순군"	10612 "장흥군"	10613 "강진군"	10614 "해남군" ///
						   10615 "영암군" ///
						   10616 "무안군"	 10617 "나주군"	10618 "함평군"	10619 "영광군"	10620 "장성군"	10621 "완도군" ///
						   10622 "진도군"	10623 "제주도"	10701 "대구부"	10702 "달성군"	10703 "군위군"	10704 "의성군" ///
						   10705 "안동군"	10706 "청송군"	10707 "영양군"	10708 "영덕군"	10709 "영일군"	10710 "경주군" ///
						   10711 "영천군"	10712 "경산군"	10713 "청도군"	10714 "고령군"	10715 "성주군"	10716 "칠곡군" ///
						   10717 "김천군"	10718 "선산군"	10719 "상주군"	10720 "문경군"	10721 "예천군"	10722 "영주군" ///
						   10723 "봉화군"	10724 "울릉도"	10801 "부산부"	10802 "마산부"	10803 "진주군"	10804 "의령군" ///
						   10805 "함안군"	10806 "창녕군"	10807 "밀양군"	10808 "양산군"	10809 "울산군"	10810 "동래군" ///
						   10811 "김해군"	10812 "창원군"	10813 "통영군"	10814 "고성군"	10815 "사천군"	10816 "남해군" ///
						   10817 "하동군"	10818 "산청군"	10819 "함양군"	10820 "거창군"	10821 "합천군"	10901 "해주군" ///
						   10902 "연백군"	10903 "금천군"	10904 "평산군"	10905 "신계군"	10906 "옹진군"	10907 "장연군" ///
						   10908 "송화군"	10909 "은율군"	10910 "안악군"	10911 "신천군"	10912 "재령군"	10913 "황주군" ///
						   10914 "봉산군"	10915 "서흥군"	10916 "수안군"	10917 "곡산군"	11001 "신의주부"	11002 "의주부" ///
						   11003 "구성군"	11004 "태천군"	11005 "운산군"	11006 "희천군"	11007 "영변군"	11008 "박천군" ///
						   11009 "정주군"	11010 "선천군"	11011 "철산군"	11012 "용천군"	11013 "삭주군"	11014 "창성군" ///
						   11015 "벽동군"	11016 "초산군"	11017 "위원군"	11018 "강계군"	11019 "자성군"	11020 "후창군" ///
						   11101 "평양부"	11102 "진남포부"	11103 "대동군"	11104 "순천군"	11105 "맹산군"	11106 "양덕군" ///
						   11107 "성천군"	11108 "강동군"	11109 "중화군"	11110 "용강군"	11111 "강서군"	11112 "평원군" ///
						   11113 "안주군"	11114 "개천군"	11115 "덕천군"	11116 "영원군"	11201 "청진부"	11202 "경성군" ///
						   11203 "명천군"	11204 "길주군"	11205 "성진군"	11206 "부령군"	11207 "무산군"	11208 "회령군" ///
						   11209 "종성군"	11210 "은성군"	11211 "경원군"	11212 "경흥군"	11301 "원산부"	11302 "함흥부" ///
						   11303 "함주군"	11304 "정평군"	11305 "영흥군"	11306 "고원군"	11307 "문천군"	11308 "덕원군" ///
						   11309 "안변군"	11310 "홍원군"	11311 "북청군"	11312 "이원군"	11313 "단천군"	11314 "신흥군" ///
						   11315 "장진군"	11316 "풍산군"	11317 "삼수군"	11318 "갑산군"
						   
label values id_district district_name 

		   
						   
label define district_name_chosen 	10101"경(京)"	10102"인천(仁川)"	10103"개성(開城)"	10104"고양(高陽)"	10105"광주(廣州)" ///
	10106"양주(楊州)"	10107"연천(漣川)"	10108"포천(抱川)"	10109"가평(加平)"	10110"양근(楊根)"	10111"여주(驪州)"	10112"이천(利川)" ///
	10113"용인(龍仁)"	10114"안성(安城)"	10115"진위(振威)"	10116"수원(水原)"	10117"시흥(始興)"	10118"부평(富平)"	10119"김포(金浦)" ///
	10120"강화(江華)"	10121"파주(坡州)"	10122"장단(長湍)"	10123"풍덕(豊德)"	10201"춘천(春川)"	10203"양구(楊口)"	10206"고성(高城)" ///
	10207"양양(襄陽)"	10208"강릉(江陵)"	10209"삼척(三陟)"	10210"울진(蔚珍)"	10211"정선(旌善)"	10213"영월(寧越)"	10214"원주(原州)"	///
	10215"횡성(橫城)"	10216"홍천(洪川)"	10218"김화(金化)"	10219"철원(鐵原)"	10220"평강(平康)"	10221"이천(伊川)"	10301"청주(淸州)" ///
	10302"보은(報恩)"	10303"옥천(沃川)"	10304"영동(永同)"	10305"진천(鎭川)"	10306"괴산(槐山)"	10307"음성(陰城)"	10308"충주(忠州)" ///
	10309"제천(堤川)"	10310"단양(丹陽)"	10401"공주(公州)"	10402"연기(燕岐)"	10403"진잠(鎭岑)"	10404"노성(魯城)"	10405"부여(扶餘)"	///
	10406"서천(舒川)"	10407"보령(保寧)"	10408"청양(靑陽)"	10409"결성(結城)"	10410"예산(禮山)"	10411"서산(瑞山)"	10412"면천(沔川)" ///
	10413"아산(牙山)"	10414"천안(天安)"	10501"교동(喬東)"	10502"전주(全州)"	10503"진안(鎭安)"	10504"금산(金山)"	10506"장수(長水)" ///
	10507"임실(任實)"	10508"남원(南原)"	10509"순창(淳昌)"	10510"고부(古阜)"	10511"고창(高敞)"	10512"부안(扶安)"	10513"김제(金堤)" ///
	10515"익산(益山)"	10602"광주(光州)"	10603"담양(潭陽)"	10604"곡성(谷城)"	10605"구례(求禮)"	10606"광양(光陽)"	10608"순천(順天)" ///
	10609"흥양(興陽)"	10610"보성(寶城)"	10611"화순(和順)"	10612"장흥(長興)"	10613"강진(康津)"	10614"해남(海南)"	10615"영암(靈巖)" ///
	10616"무안(務安)"	10617"나주(羅州)"	10618"함평(咸平)"	10619"영광(靈光)"	10620"장성(長城)"	10621"요산(遼山)"	10622"济州道" ///
	10623"제주(濟州)"	10701"대구(大邱)"	10702"대구(大丘)"	10703"군위(軍威)"	10704"의성(義城)"	10705"안동(安東)"	10706"청송(靑松)" ///
	10707"영양(英陽)"	10708"영해(寧海)"	10709"영유(永柔)"	10710"경주(慶州)"	10711"영천(永川)"	10712"경산(慶山)"	10713"청도(淸道)" ///
	10714"고령(高靈)"	10715"성주(星州)"	10716"칠곡(漆谷)"	10717"김천(金川)"	10718"선산(善山)"	10719"상주(尙州)"	10720"문경(聞慶)" ///
	10721"예천(醴泉)"	10722"영천(榮川)"	10723"봉화(奉化)"	10803"진주(晉州)"	10804"의령(宜寧)"	10805"함안(咸安)"	10806"창녕(昌寧)" ///
	10807"밀양(密陽)"	10808"양산(梁山)"	10809"울산(蔚山)"	10811"김해(金海)"	10812"의안(義安)"	10814"고성(固城)"	10818"산청(山淸)" ///
	10819"함양(咸陽)"	10820"거창(居昌)"	10821"합천(陜川)"	10901"해주(海州)"	10902"배천(白川)"	10903"우봉(牛峰)"	10904"평산(平山)" ///
	10905"신계(新溪)"	10907"장연(長淵)"	10908"송화(松禾)"	10909"은율(殷栗)"	10910"안악(安岳)"	10911"신천(信川)"	10912"재령(載寧)" ///
	10913"황주(黃州)"	10914"봉산(鳳山)"	10915"서흥(瑞興)"	10916"수안(遂安)"	10917"곡산(谷山)"	11002"의주(義州)"	11003"구성(龜城)"	///
	11004"태천(泰川)"	11005"운산(雲山)"	11006"희천(熙川)"	11007"영변(寧邊)"	11008"박천(博川)"	11009"정주(定州)"	11010"선천(宣川)" ///
	11011"철산(鐵山)"	11012"용천(龍川)"	11013"삭주(朔州)"	11014"창성(昌城)"	11015"벽동(碧潼)"	11017"위원(渭原)"	11018"강계(江界)"	///
	11101"평양(平壤)"	11104"은산(殷山)"	11105"맹산(孟山)"	11106"양덕(陽德)"	11107"성천(成川)"	11108"강동(江東)"	11109"중화(中和)"	///
	11110"용강(龍岡)"	11111"강서(江西)"	11112"숙천(肅川)"	11113"안주(安州)"	11114"개천(价川)"	11115"덕천(德川)"	11116"영원(寧遠)"	///
	11202"경성(鏡城)"	11203"명천(明川)"	11204"길주(吉州)"	11206"부령(扶寧)"	11207"무산(茂山)"	11208"회령(會寧)"	11209"종성(鍾城)"	///
	11211"경원(慶源)"	11212"경흥(慶興)"	11302"함흥(咸興)"	11304"정평(定平)"	11305"영흥(永興)"	11306"고원(高原)"	11308"덕원(德源)" ///
	11309"안변(安邊)"	11310"홍원(洪原)"	11311"북청(北靑)"	11313"단천(端川)"	11315"장진(長津)"	11317"삼수(三水)"   

	
gen district_joseonn = id_district   		
rename district_joseonn district_joseon


label values district_joseon district_name_chosen 
label var district_joseon   "District name in Joseon"
drop district

*************** Repeated variables cleaning **************************	

drop _merge*
drop mergednumber*

save "$temp_data/final_data.dta", replace 
*****************************************************

use "$temp_data/final_data.dta" 

*** create the variable "North"

gen north = 0
replace north = 1 if id_prov == 109|id_prov == 110|id_prov == 111|id_prov == 112|id_prov == 113 

tab north 

label var north "North Korea or not (N =1 S= 0)"	

save "$temp_data/final_data.dta" , replace	


****summmarize of data ******

outreg2 using "$result/descriptive_summary.doc",label replace sum(log)  ///
        keep(pop_den yangban1 dist2seoul_km ten_ratio soil_mean soil_mean2 soil_var) ///
	    eqkeep(N mean min max) title(Descriptive Statistics)	 
	 
				   						   
						  
				
***********************  Baseline regression  Table 1     ********************************


use "$temp_data/final_data.dta"

eststo clear 

local control "pop_den yangban1 dist2seoul_km ten_ratio soil_mean soil_mean2 soil_var _I*"   

qui reg manu_ratio_normal mungua_normal school_normal `control' , robust
eststo k1

qui reg development mungua_normal school_normal  `control', robust
eststo k2

qui reg manu_ratio_normal  kor_lit_rate  mungua_normal school_normal `control' , robust
eststo k3

qui reg development kor_lit_rate mungua_normal school_normal `control' , robust
eststo k4

qui reg manu_ratio_normal jap_lit_rate school_normal mungua_normal `control' , robust 
eststo k5

qui reg development jap_lit_rate school_normal mungua_normal `control' , robust
eststo k6


esttab k* using "$result/Baseline.rtf", label se(3) b(a3) star(* .1 ** .05 *** .01)  ///
       order (*_lit_rate school_normal mungua* yangban1 soil*) ///
       ar2 scalar(N) indicate("Province Fixed Effect = _I*") nogap compress replace 

eststo clear 

********** for other non-agriculture industry ratio *****

local control "pop_den yangban1  dist2seoul_km ten_ratio soil_mean soil_mean2 soil_var _I*"  

***** mungua_normal school_normal  *******************************

qui reg commerce_ratio_normal  mungua_normal school_normal `control' , robust
eststo a1

qui reg transport_ratio_normal  mungua_normal school_normal `control' , robust
eststo a2

qui reg mining_ratio_normal  mungua_normal school_normal `control' , robust
eststo a3

****** Koreanliteracy ***********
qui reg commerce_ratio_normal  kor_lit_rate  mungua_normal school_normal `control' , robust
eststo a4

qui reg transport_ratio_normal  kor_lit_rate  mungua_normal school_normal `control' , robust
eststo a5

qui reg mining_ratio_normal kor_lit_rate mungua_normal school_normal `control' , robust
eststo a6

*****Japanese literacy *********

qui reg commerce_ratio_normal jap_lit_rate  mungua_normal school_normal `control' , robust
eststo a7

qui reg transport_ratio_normal  jap_lit_rate  mungua_normal school_normal `control' , robust
eststo a8

qui reg mining_ratio_normal jap_lit_rate mungua_normal school_normal `control' , robust
eststo a9


esttab a* using "$result/other_industry_ratio_lit.rtf", label se(3) b(a3) star(* .1 ** .05 *** .01)  ///
       order (kor_lit_rate jap_lit_rate school_normal mungua* yangban1 soil*) ///
       ar2 scalar(N) indicate("Province Fixed Effect = _I*") nogap compress replace  
	   
	   
******** if using 2sls (first-stage:reg school pop_den 2_stage;) ******** 
 
eststo clear 

local control "pop_den yangban1 dist2seoul_km dist2busan_km ten_ratio soil_mean soil_mean2 soil_var _I*"   

reg school_normal pop_den mungua_normal `control', robust 

est store first_stage

predict residual 

qui reg non_af_ratio_normal mungua_normal `control', robust 
eststo a1

qui reg manu_ratio_normal school_normal_hat mungua_normal `control', robust 
eststo a2

qui reg commerce_ratio_normal school_normal_hat mungua_normal `control', robust 
eststo a3

qui reg transport_ratio_normal school_normal_hat mungua_normal `control', robust 
eststo a4	
	 
qui reg mining_ratio_normal school_normal_hat mungua_normal `control', robust 
eststo a5

esttab first_stage a* using "$result/industry_ratio_2sls.rtf", label se(3) b(a3) star(* .1 ** .05 *** .01)  ///
       order (pop_den school_normal_hat mungua* yangban1 soil*) ///
       ar2 scalar(N) indicate("Province Fixed Effect = _I*") nogap compress replace  
	   			 
eststo clear 

*****************************************
drop school_resid

local control "yangban1 dist2seoul_km dist2busan_km ten_ratio soil_mean soil_mean2 soil_var _I*"   

reg school_normal pop_den  `control', robust 

eststo first_stage

predict school_resid , residuals 
 
local control "pop_den yangban1 dist2seoul_km dist2busan_km ten_ratio soil_mean soil_mean2 soil_var _I*"  

qui reg non_af_ratio_normal school_resid mungua_normal `control', robust 
eststo a1

qui reg manu_ratio_normal school_resid mungua_normal `control', robust 
eststo a2

qui reg commerce_ratio_normal school_resid mungua_normal `control', robust 
eststo a3

qui reg transport_ratio_normal school_resid mungua_normal `control', robust 
eststo a4 
  
qui reg mining_ratio_normal school_resid mungua_normal `control', robust 
eststo a5

esttab first_stage a* using $tables/industry_ratio_2sls.rtf, label se(3) b(a3) star(* .1 ** .05 *** .01)  ///
       order (pop_den school_resid mungua* yangban1 soil*) ///
       ar2 scalar(N) indicate("Province Fixed Effect = _I*") nogap compress replace  
	   
eststo clear
	   
	   
     
*******************************************************************************
   




local control "pop_den yangban1 dist2seoul_km dist2busan_km ten_ratio soil_mean soil_mean2 soil_var _I*"   

qui reg non_af_ratio_normal s mungua_normal `control', robust 
eststo a1

qui reg manu_ratio_normal school_normal_hat mungua_normal `control', robust 
eststo a2

qui reg commerce_ratio_normal school_normal_hat mungua_normal `control', robust 
eststo a3

qui reg transport_ratio_normal school_normal_hat mungua_normal `control', robust 
eststo a4 
  
qui reg mining_ratio_normal school_normal_hat mungua_normal `control', robust 
eststo a5

esttab first_stage a* using "$result/industry_ratio_2sls.rtf", label se(3) b(a3) star(* .1 ** .05 *** .01)  ///
       order (pop_den school_normal_hat mungua* yangban1 soil*) ///
       ar2 scalar(N) indicate("Province Fixed Effect = _I*") nogap compress replace  
     
   
eststo clear



	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
**** merge the gis data **********************************************************************
import delimited "$data/district_name.csv"

gen district2 = substr(district, 1, strlen(district) - 3) // delete the last word of district name

rename district2 district_name 

gen prov_name = "경기"
replace prov_name = "강원" if id_prov == 102
replace prov_name = "충북" if id_prov == 103
replace prov_name = "충남" if id_prov == 104 
replace prov_name = "전북" if id_prov == 105
replace prov_name = "전남" if id_prov == 106
replace prov_name = "경북" if id_prov == 107 
replace prov_name = "경남" if id_prov == 108
replace prov_name = "황해" if id_prov == 109
replace prov_name = "평북" if id_prov == 110
replace prov_name = "평남" if id_prov == 111
replace prov_name = "함북" if id_prov == 112 
replace prov_name = "함남" if id_prov == 113

gen sp_id = prov_name + "_" + district_name 

save  "$data/prov_district_name.dta", replace 

clear

import delimited "$data/korea_point_G.csv"

rename dist dist2busan_km

save "$data/korea_point_G.dta", replace 
	   
merge m:1 sp_id using "$data/prov_district_name.dta" // merge with id information 


replace id_district = 11210 if name == "온성" // lost the id_district of "온성"

replace fid =234 if if id_district == 11210

replace adm_lv1_1 = "함북" if if id_district == 11210
replace prov_name = "함북" if if id_district == 11210
 
replace id_prov = 112 if id_district == 11210

replace district = "온성군" if id_district == 11210
replace district_name = "온성" if id_district == 11210

drop if _merge == 2

drop _merge 

save "$data/korea_point_merge.dta", replace 

clear

******Use shp file data to merge the merge data  with fid *******************

import delimited "$data/gis_railway.csv" // shp file contains the railway information 

gen railway_km = railway_lengthm / 1000

gen railway_intensity = railway_km / areakm2

replace railway_intensity = railway_intensity * 100 //become %

label var railway_intensity "Railway intensity" // confirm the railway intensity 

***********Merge the railway information and id_district ********************************
rename adm_lv2_1 district_name 

rename adm_lv1_1 prov_name 

save "$temp_data/railway_korea1930.csv", replace 

bysort district_name prov_name : gen matchid = _n 

tab matchid // no dup 

save "$temp_data/railway_korea1930.dta", replace 

****** should have the same name ******* 

merge 1:m sp_id using "$data/korea_point_merge.dta"  // this data contain id_district

replace railway_intensity  = 0 if _merge == 1 | _merge == 2 // railway_intensity should be 0 then keep the _ID 

drop name 

order sp_id railway_intensity id_prov id_district // look at the data structure 

drop _merge

************* double check the duplicate *****************************
sort id_district name 
quietly by id_district name: gen dup = cond(_N==1,0,_n)

tab dup

drop if dup > 1 

order id_district name 
sort id_district name 

save "$temp_data/railway_id_district.dta", replace 

******* merge with the final data *******************************

use "$temp_data/railway_id_district.dta", clear

drop _merge 

clear

use "$temp_data/final_data.dta", clear

drop _merge

save "$temp_data/final_data.dta", replace 


merge m:1 sp_id using "$temp_data/railway_id_district.dta"

order _merge sp_id 

keep if _merge == 3 // 234 district at 1930 

***** values the dist (distance to Busan) **************


label var dist2busan_km "Distance to Busan (km)"

save "$temp_data/final_data2.dta",replace    



***********  table 2 Fixed effect 2******************************************************************* 


use "$temp_data/final_data2.dta", clear

eststo clear

replace railway_intensity = . if railway_intensity == 0

save "$temp_data/final_data2.dta", replace 
 
***** adding the proxy of investment in the district level: intensity of railway *******

use "$temp_data/final_data2.dta", replace 

local control "pop_den dist2busan_km dist2seoul_km ten_ratio soil_mean soil_mean2 soil_var _I*"


qui reg manu_ratio_normal kor_lit_rate school_normal mungua_normal railway_intensity `control', robust 
eststo m1	

qui reg transport_ratio_normal kor_lit_rate school_normal mungua_normal railway_intensity `control', robust 
eststo m2

qui reg mining_ratio_normal kor_lit_rate school_normal mungua_normal railway_intensity `control' , robust 
eststo m3

qui reg commerce_ratio_normal kor_lit_rate school_normal mungua_normal railway_intensity `control' , robust 	
eststo m4

qui reg development kor_lit_rate school_normal mungua_normal railway_intensity `control' , robust 
eststo m5

qui reg manu_ratio_normal jap_lit_rate school_normal mungua_normal railway_intensity `control' , robust 		
eststo m6

qui reg transport_ratio_normal jap_lit_rate school_normal mungua_normal railway_intensity `control' , robust 	
eststo m7

qui reg mining_ratio_normal jap_lit_rate school_normal mungua_normal railway_intensity `control' , robust 	
eststo m8

qui reg commerce_ratio_normal jap_lit_rate school_normal mungua_normal railway_intensity `control' , robust 
eststo m9

qui reg development jap_lit_rate school_normal mungua_normal railway_intensity `control', robust 
eststo m10


esttab m* using "$result/fixed_effect11.rtf", label se(3) b(a3) star(* .1 ** .05 *** .01)  ///
       order (kor_lit_rate jap_lit_rate school_normal mungua*) ///
       ar2 scalar(N) indicate("Province Fixed Effect = _I*") nogap compress replace  
	   
eststo clear 


********schools and teachers effect on non-agriculture industries *****************************************

eststo clear

local control2 "railway_intensity pop_den dist2busan_km dist2seoul_km ten_ratio soil_mean soil_mean2 soil_var _I*"

qui reg school_normal mungua_ext_normal `control2', robust
eststo aa1
qui reg teacher_normal mungua_ext_normal `control2', robust
eststo aa2

qui reg development school_normal mungua_ext_normal `control2', robust
eststo aa3

qui reg development teacher_normal mungua_ext_normal `control2', robust
eststo aa4


esttab aa* using "$result/school_teacher_development.rtf", label se(3) b(a3) star(* .1 ** .05 *** .01)  ///
       order (school_normal teacher_normal mungua_ext_normal) ///
       ar2 scalar(N) indicate("Province Fixed Effect = _I*") nogap compress replace  
	   
eststo clear 



****school and teacher effect on new industries (manufacture comm  and transport ) *************************
eststo clear 

local control2 "railway_intensity pop_den dist2busan_km dist2seoul_km ten_ratio soil_mean soil_mean2 soil_var _I*"

qui reg manu_ratio_normal school_normal teacher_normal mungua_ext_normal `control2', robust
eststo ab1

qui reg manu_ratio_normal kor_lit_rate school_normal teacher_normal mungua_ext_normal `control2', robust
eststo ab2

qui reg manu_ratio_normal jap_lit_rate school_normal teacher_normal mungua_ext_normal `control2', robust
eststo ab3

qui reg transport_ratio_normal school_normal teacher_normal mungua_ext_normal `control2', robust
eststo ab4

qui reg transport_ratio_normal kor_lit_rate school_normal teacher_normal mungua_ext_normal `control2', robust
eststo ab5

qui reg transport_ratio_normal jap_lit_rate school_normal teacher_normal mungua_ext_normal `control2', robust
eststo ab6

qui reg commerce_ratio_normal school_normal teacher_normal mungua_ext_normal `control2', robust
eststo ab7

qui reg commerce_ratio_normal kor_lit_rate school_normal teacher_normal mungua_ext_normal `control2', robust
eststo ab8

qui reg commerce_ratio_normal jap_lit_rate school_normal teacher_normal mungua_ext_normal `control2', robust
eststo ab9


esttab ab* using "$result/school_teacher_industries.rtf", label se(3) b(a3) star(* .1 ** .05 *** .01)  ///
       order (kor_lit_rate jap_lit_rate school_normal mungua*) ///
       ar2 scalar(N) indicate("Province Fixed Effect = _I*") nogap compress replace  
	   
eststo clear 











