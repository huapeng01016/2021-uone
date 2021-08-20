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

The result is the [following table](./src/group.html) with group and model as
column headers.

table {
  border-collapse: collapse;
}

.default1_1_x {
}

.default1_2_x {
}

.default1_3_x {
}

.default1_4_x {
}

.default1_5_x {
}

.default1_6_x {
}

.default1_7_x {
}

.default1_8_x {
}

.default1_9_x {
}

.default1_10_x {
}

.default1_11_x {
}

.default1_12_x {
}

.default1_13_x {
}

.default1_14_x {
}

.default1_15_x {
}

.default1_16_x {
}

.default1_17_x {
}

.default1_x_1 {
}

.default1_x_2 {
}

.default1_x_3 {
}

.default1_x_4 {
}

.default1_1_1 {
  border-right-style: solid;
  border-top-style: solid;
  text-decoration: none;
  text-align: center;
  vertical-align: bottom;
}

.default1_1_2 {
  border-top-style: solid;
  text-decoration: none;
  text-align: center;
  vertical-align: bottom;
}

.default1_1_3 {
  border-top-style: solid;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_1_4 {
  border-top-style: solid;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_2_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: center;
  vertical-align: bottom;
}

.default1_2_2 {
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_2_3 {
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_2_4 {
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_3_1 {
  border-right-style: solid;
  border-top-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_3_2 {
  padding-left: 10pt;
  border-top-style: solid;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_3_3 {
  padding-left: 10pt;
  border-top-style: solid;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_3_4 {
  padding-left: 10pt;
  border-top-style: solid;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_4_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_4_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_4_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_4_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_5_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_5_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_5_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_5_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_6_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_6_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_6_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_6_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_7_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_7_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_7_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_7_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_8_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_8_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_8_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_8_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_9_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_9_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_9_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_9_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_10_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_10_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_10_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_10_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_11_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_11_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_11_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_11_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_12_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_12_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_12_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_12_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_13_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_13_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_13_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_13_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_14_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_14_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_14_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_14_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_15_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_15_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_15_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_15_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_16_1 {
  border-right-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_16_2 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_16_3 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_16_4 {
  padding-left: 10pt;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_17_1 {
  border-right-style: solid;
  border-bottom-style: solid;
  text-decoration: none;
  text-align: left;
  vertical-align: bottom;
}

.default1_17_2 {
  padding-left: 10pt;
  border-bottom-style: solid;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_17_3 {
  padding-left: 10pt;
  border-bottom-style: solid;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

.default1_17_4 {
  padding-left: 10pt;
  border-bottom-style: solid;
  text-decoration: none;
  text-align: right;
  vertical-align: bottom;
}

</style>

</head>

<body>

<table class="default1">
  <tr class="default1_1_x">
    <td class="default1_x_1 default1_1_1">&nbsp;</td>
    <td colspan="2" class="default1_x_2 default1_1_2">1</td>
    <td class="default1_x_4 default1_1_4">2</td>
  </tr>
  <tr class="default1_2_x">
    <td class="default1_x_1 default1_2_1">&nbsp;</td>
    <td class="default1_x_2 default1_2_2">(1)</td>
    <td class="default1_x_3 default1_2_3">(2)</td>
    <td class="default1_x_4 default1_2_4">(3)</td>
  </tr>
  <tr class="default1_3_x">
    <td class="default1_x_1 default1_3_1">油量消耗(公升每一百公里)</td>
    <td class="default1_x_2 default1_3_2"></td>
    <td class="default1_x_3 default1_3_3"></td>
    <td class="default1_x_4 default1_3_4"></td>
  </tr>
  <tr class="default1_4_x">
    <td class="default1_x_1 default1_4_1">&nbsp;&nbsp;Coefficient</td>
    <td class="default1_x_2 default1_4_2">.3281843</td>
    <td class="default1_x_3 default1_4_3">.307205</td>
    <td class="default1_x_4 default1_4_4">.296502</td>
  </tr>
  <tr class="default1_5_x">
    <td class="default1_x_1 default1_5_1">&nbsp;&nbsp;Std. error</td>
    <td class="default1_x_2 default1_5_2">.1063047</td>
    <td class="default1_x_3 default1_5_3">.1145879</td>
    <td class="default1_x_4 default1_5_4">.1128835</td>
  </tr>
  <tr class="default1_6_x">
    <td class="default1_x_1 default1_6_1">豪华</td>
    <td class="default1_x_2 default1_6_2"></td>
    <td class="default1_x_3 default1_6_3"></td>
    <td class="default1_x_4 default1_6_4"></td>
  </tr>
  <tr class="default1_7_x">
    <td class="default1_x_1 default1_7_1">&nbsp;&nbsp;Coefficient</td>
    <td class="default1_x_2 default1_7_2">9.355225</td>
    <td class="default1_x_3 default1_7_3">1.757733</td>
    <td class="default1_x_4 default1_7_4">15.64538</td>
  </tr>
  <tr class="default1_8_x">
    <td class="default1_x_1 default1_8_1">&nbsp;&nbsp;Std. error</td>
    <td class="default1_x_2 default1_8_2">9.354425</td>
    <td class="default1_x_3 default1_8_3">7.638619</td>
    <td class="default1_x_4 default1_8_4">88.32325</td>
  </tr>
  <tr class="default1_9_x">
    <td class="default1_x_1 default1_9_1">豪华 # 油量消耗(公升每一百公里)</td>
    <td class="default1_x_2 default1_9_2"></td>
    <td class="default1_x_3 default1_9_3"></td>
    <td class="default1_x_4 default1_9_4"></td>
  </tr>
  <tr class="default1_10_x">
    <td class="default1_x_1 default1_10_1">&nbsp;&nbsp;Coefficient</td>
    <td class="default1_x_2 default1_10_2"></td>
    <td class="default1_x_3 default1_10_3">1.333683</td>
    <td class="default1_x_4 default1_10_4">.8374684</td>
  </tr>
  <tr class="default1_11_x">
    <td class="default1_x_1 default1_11_1">&nbsp;&nbsp;Std. error</td>
    <td class="default1_x_2 default1_11_2"></td>
    <td class="default1_x_3 default1_11_3">.980851</td>
    <td class="default1_x_4 default1_11_4">.8163852</td>
  </tr>
  <tr class="default1_12_x">
    <td class="default1_x_1 default1_12_1">质量良好</td>
    <td class="default1_x_2 default1_12_2"></td>
    <td class="default1_x_3 default1_12_3"></td>
    <td class="default1_x_4 default1_12_4"></td>
  </tr>
  <tr class="default1_13_x">
    <td class="default1_x_1 default1_13_1">&nbsp;&nbsp;Coefficient</td>
    <td class="default1_x_2 default1_13_2"></td>
    <td class="default1_x_3 default1_13_3"></td>
    <td class="default1_x_4 default1_13_4">1</td>
  </tr>
  <tr class="default1_14_x">
    <td class="default1_x_1 default1_14_1">&nbsp;&nbsp;Std. error</td>
    <td class="default1_x_2 default1_14_2"></td>
    <td class="default1_x_3 default1_14_3"></td>
    <td class="default1_x_4 default1_14_4">0</td>
  </tr>
  <tr class="default1_15_x">
    <td class="default1_x_1 default1_15_1">Intercept</td>
    <td class="default1_x_2 default1_15_2"></td>
    <td class="default1_x_3 default1_15_3"></td>
    <td class="default1_x_4 default1_15_4"></td>
  </tr>
  <tr class="default1_16_x">
    <td class="default1_x_1 default1_16_1">&nbsp;&nbsp;Coefficient</td>
    <td class="default1_x_2 default1_16_2">61.91038</td>
    <td class="default1_x_3 default1_16_3">82.41572</td>
    <td class="default1_x_4 default1_16_4">117.7643</td>
  </tr>
  <tr class="default1_17_x">
    <td class="default1_x_1 default1_17_1">&nbsp;&nbsp;Std. error</td>
    <td class="default1_x_2 default1_17_2">89.09944</td>
    <td class="default1_x_3 default1_17_3">135.4557</td>
    <td class="default1_x_4 default1_17_4">200.5851</td>
  </tr>
</table>
 
