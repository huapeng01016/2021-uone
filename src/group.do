version 17

/*
	collect style column, dups(center)
*/
cscript

use auto_zh.dta, clear

gen 价格指标 = cond( 价格 > 9000, 1, 0)
label define 价格指标 1 "豪华" 0 "非豪华" 
label value 价格指标 价格指标
gen  维修指标 = cond(维修记录78 < 2, 1, 0) if 维修记录78 < .
label define 维修指标 1 "质量良好" 0 "质量一般" 
label value 维修指标 维修指标

**# thress estimation models to collect		
collect clear                 
collect _r_b _r_se, tags(group[1] model[(1)]): logistic 国籍 c.油耗 i.价格指标
collect AIC=r(S)[1,"AIC"] BIC=r(S)[1,"BIC"], tag(group[1] model[(1)]): estat ic

collect _r_b _r_se, tag(group[1] model[(2)]): logistic 国籍 c.油耗##i.价格指标
collect AIC=r(S)[1,"AIC"] BIC=r(S)[1,"BIC"], tag(group[1] model[(2)]): estat ic

collect _r_b _r_se, tag(group[2] model[(3)]): logistic 国籍 c.油耗##i.价格指标 i.维修指标
collect AIC=r(S)[1,"AIC"] BIC=r(S)[1,"BIC"], tag(group[2] model[(3)]): estat ic
                   
collect layout (colname#result) (group#model)                 
collect style showbase off
collect style column, dups(center)
collect preview

