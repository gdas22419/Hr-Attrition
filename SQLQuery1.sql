select * from general_data

-- PROBLEM STATEMENT- 01
-- NO OF EMPLOYEE WANTS ATTRITION
select max(attrition)as attrition,
count(attrition)as no_of_ppl,
count(*)*100/(select count(*) from general_data) AS 'PERCENTAGE'
from general_data
group by attrition

-- PROBLEM SATATEMET- 02 
-- GENDER DISTRIBUTION IN EMPLOYEE ATTRITION
SELECT 
MAX(attrition) as Attrition,
COUNT(attrition) AS NO_of_ppl,
count(*)*100/(select count(*)from general_data)as 'Percenrtage'
FROM general_data
where gender='male'
group by attrition

-- problem statement 03 
-- what is the effect of age on attrition
with table1 as (
select attrition, 
case 
   when age>=18 and age<=25 then '18-25'
   when age>25 and age<=35 then '25-35'
   when age>35 and age<=45 then '35-45'
   when age>45 and age<=55 then '45-55'
   else 'NA'
end as agebracket

from general_data
)
select 
  agebracket,
  attrition,
  count(attrition)as emp_att
from table1
where attrition='no'
group by
agebracket,attrition
order by emp_att

-- problem statement 04
-- is income is the main factor for employee attrition

select max(MonthlyIncome)  from general_data

with table2 as (
select attrition, 
case 
   when MonthlyIncome>=10090 and MonthlyIncome<=20000 then '10k-20k'
   when MonthlyIncome>20000 and MonthlyIncome<=40000 then '20k-40k'
   when MonthlyIncome>40000 and MonthlyIncome<=80000 then '40k-80k'
   when MonthlyIncome>80000 and MonthlyIncome<=150000 then '80k-150k'
   else 'more than 150k'
end as salarybracket

from general_data
)
select 
  salarybracket,
  attrition,
  count(attrition)as emp_att
from table2
where attrition='no'
group by
salarybracket,attrition
order by emp_att

--- problem statement 05
-- does the depart work impact the attrition
select * from general_data

select department ,attrition, count(attrition) from general_data
group by department,attrition

-- problem statement 06
-- how percentage salary hiked impact the attrition
select percentsalaryhike , attrition, count(attrition) counts from general_data
where attrition='yes'
group by percentsalaryhike,attrition
order by counts desc

--- problem statement 07
-- in which job level emp attrition more
select joblevel ,attrition, count(attrition)as counts from general_data
where attrition ='yes'
group by attrition,joblevel
order by counts desc

--problem statement 08
-- how year since last pormotion impact attrition
select yearssincelastpromotion,attrition,count(attrition)as counts from general_data
where attrition='yes'
group by attrition,yearssincelastpromotion
order by counts desc

-- problem statement 09
-- how yeas at company impact attrition
select yearsatcompany,attrition,count(attrition)as counts from general_data
where attrition='yes'
group by attrition,yearsatcompany
order by counts desc

--problem statement 10
-- how yeaswith manager impact attrition
select * from general_data
select yearswithcurrmanager,attrition,count(attrition)as counts from general_data
where attrition='yes'
group by attrition,yearswithcurrmanager
order by counts desc