--- Total number of suicide around the world from 1979 - 2016
select SUM(Convert(int,suicides_no)) as [Total Suicide]
from dbo.suicide

--- How many of suicide are male and female
Select Sex, SUM(convert(int,suicides_no)) as [Total Suicides]
from dbo.suicide
group by sex

-- Group by age range
Select age, SUM(convert(int,suicides_no)) as [Total suicides]
from dbo.suicide
Group by age
Order by [Total suicides] DESC

--Group by country
Select top (10) country, SUM(Convert(int, suicides_no)) as [Total Suicides]
from dbo.suicide
Group by country
order by [Total suicides] DESC

--- Rank age range, parition by sex, for specific country/year
select age, sex, suicides_no,
Rank() OVER(partition by sex order by convert(int,suicides_no) DESC) as Rnk
from dbo.suicide
where country = 'united kingdom' AND year = 2010
