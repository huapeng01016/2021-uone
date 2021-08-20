# 2021-uone
Talk for 2021 Chinese User Group Meeting by UONE Tech


## How to use **collect** to replicate *mgroup* in **estout**


**collect** allows multiple tags, which can be used to add a dimension or level to the table.

```
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

* there are two tags, group and model
* 3 models are in 2 groups, the first 2 in group 1 and the third in group 2
		
collect clear                 
collect _r_b _r_se, tags(group[1] model[(1)]): logistic 国籍 c.油耗 i.价格指标
collect AIC=r(S)[1,"AIC"] BIC=r(S)[1,"BIC"], tag(group[1] model[(1)]): estat ic

collect _r_b _r_se, tag(group[1] model[(2)]): logistic 国籍 c.油耗##i.价格指标
collect AIC=r(S)[1,"AIC"] BIC=r(S)[1,"BIC"], tag(group[1] model[(2)]): estat ic

collect _r_b _r_se, tag(group[2] model[(3)]): logistic 国籍 c.油耗##i.价格指标 i.维修指标
collect AIC=r(S)[1,"AIC"] BIC=r(S)[1,"BIC"], tag(group[2] model[(3)]): estat ic
                   
collect layout (colname#result) (group#model)                 
collect style showbase off

* instead of showing group as 1 1 2, 
* the next will collapse the two duplicate 1 to one
collect style column, dups(center)
collect preview
```

The result is:

|                                 | 1        |          | 2        |
|                                 | (1)      | (2)      | (3)      |
| ------------------------------- | -------- | -------- | -------- |
| 油量消耗(公升每一百公里)        |          |          |          |
|   Coefficient                   | .3281843 | .307205  | .296502  |
|   Std. error                    | .1063047 | .1145879 | .1128835 |
| 豪华                            |          |          |          |
|   Coefficient                   | 9.355225 | 1.757733 | 15.64538 |
|   Std. error                    | 9.354425 | 7.638619 | 88.32325 |
| 豪华 # 油量消耗(公升每一百公里) |          |          |          |
|   Coefficient                   |          | 1.333683 | .8374684 |
|   Std. error                    |          | .980851  | .8163852 |
| 质量良好                        |          |          |          |
|   Coefficient                   |          |          | 1        |
|   Std. error                    |          |          | 0        |
| Intercept                       |          |          |          |
|   Coefficient                   | 61.91038 | 82.41572 | 117.7643 |
|   Std. error                    | 89.09944 | 135.4557 | 200.5851 |
