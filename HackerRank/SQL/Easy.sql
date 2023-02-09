--1. Revising_the_Select_Query_I  https://www.hackerrank.com/challenges/revising-the-select-query/problem

select * from city where population > 100000 and CountryCode = 'USA';

--2. Revising_the_Select_Query_II https://www.hackerrank.com/challenges/revising-the-select-query-2/problem

select name from city where countrycode = 'USA' and population > 120000;

--3. Select_All https://www.hackerrank.com/challenges/select-all-sql/problem

select * from city;

--4. Select_By_ID https://www.hackerrank.com/challenges/select-by-id/problem

select * from city where id = 1661;

--5. Japanese_Cities_Names https://www.hackerrank.com/challenges/japanese-cities-name/problem

select name from city where COUNTRYCODE = 'JPN';

--6. Japanese_Cities_Attributes  https://www.hackerrank.com/challenges/japanese-cities-attributes/problem

select * from city where COUNTRYCODE = 'JPN';

--7. Weather_Observation_Station_1  https://www.hackerrank.com/challenges/weather-observation-station-1/problem

select CITY, STATE from STATION;

--8. Weather_Observation_Station_3  https://www.hackerrank.com/challenges/weather-observation-station-3/problem

select distinct city from station where mod(id, 2) = 0 ;

--9. Weather_Observation_Station_4 https://www.hackerrank.com/challenges/weather-observation-station-4/problem

select count(city) - count(distinct city) from station;

--10. Weather_Observation_Station_5  https://www.hackerrank.com/challenges/weather-observation-station-5/problem

select * from (select city, length(city) from station order by length(city) desc, city asc ) where rownum < 2 ;
select * from (select city, length(city) from station order by length(city) asc, city asc ) where rownum < 2 ;

--11. Weather_Observation_Station_6 https://www.hackerrank.com/challenges/weather-observation-station-6/problem

select distinct city from station where lower(substr(city,1,1)) in ('a','e','i','o','u');
select distinct city from station where  regexp_like (lower(substr(city,1,1)), '[aeiou]');

-- 12. Weather_Observation_Station_7  https://www.hackerrank.com/challenges/weather-observation-station-7/problem

select distinct city from station where regexp_like(lower(substr(city,length(city),1)),'[aeiou]');
select distinct city from station where lower(substr(city,length(city),1)) in ('a','e','i','o','u');

--13. Weather_Observation_Station_8  https://www.hackerrank.com/challenges/weather-observation-station-8/problem

select distinct city from station where regexp_like(lower(substr(city,length(city),1)),'[aeiou]') and regexp_like(lower(substr(city,1,1)),'[aeiou]');
select distinct city from station where lower(substr(city,length(city),1)) in ('a','e','i','o','u') and lower(substr(city,1,1)) in ('a','e','i','o','u');

--14. Weather_Observation_Station_9 https://www.hackerrank.com/challenges/weather-observation-station-9/problem

select distinct city from station where regexp_like(lower(substr(city,1,1)),'[^aeiou]') ;
select distinct city from station where lower(substr(city,1,1)) not in ('a','e','i','o','u');

--15. Weather_Observation_Station_10  https://www.hackerrank.com/challenges/weather-observation-station-10/problem

select distinct city from station where regexp_like(lower(substr(city,length(city),1)),'[^aeiou]') ;
select distinct city from station where lower(substr(city,length(city),1)) not in ('a','e','i','o','u');

--16. Weather_Observation_Station_11 https://www.hackerrank.com/challenges/weather-observation-station-11/problem

select distinct city from station where regexp_like(lower(substr(city,length(city),1)),'[^aeiou]') or regexp_like(lower(substr(city,1,1)),'[^aeiou]');
select distinct city from station where lower(substr(city,length(city),1)) not in ('a','e','i','o','u') or lower(substr(city,1,1)) not in ('a','e','i','o','u');

--17.  Weather_Observation_Station_12   https://www.hackerrank.com/challenges/weather-observation-station-12/problem

select distinct city from station where regexp_like(lower(substr(city,length(city),1)),'[^aeiou]') and regexp_like(lower(substr(city,1,1)),'[^aeiou]');
select distinct city from station where lower(substr(city,length(city),1)) not in ('a','e','i','o','u') and lower(substr(city,1,1)) not in ('a','e','i','o','u');

--18. Higher_Than_75_Marks  https://www.hackerrank.com/challenges/more-than-75-marks/problem

select name from students where marks > 75 order by substr(name, length(name)-2) asc, id asc;

--19. Employee_Names  https://www.hackerrank.com/challenges/name-of-employees/problem

select name from employee order by name;

--20. Employee_Salaries  https://www.hackerrank.com/challenges/salary-of-employees/problem

select name from employee where salary > 2000 and months < 10 order by employee_id;

--21. Type_of_Triangle https://www.hackerrank.com/challenges/what-type-of-triangle/problem

select case 
        when (a+b <= c) or (a+c <= b) or (b+c <= a) then 'Not A Triangle'
        when a=b and b=c then 'Equilateral'
        when a=b or c=b or a=c  then 'Isosceles'
        else 'Scalene'
     end
from triangles;

--22. Revising_Aggregations-Averages https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem

select avg(population) from city where district = 'California';

--23. Revising_Aggregations-The_Count_Function https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem

select count(*) from city where population > 100000;

--24. Revising_Aggregations-The_Sum_Function  https://www.hackerrank.com/challenges/revising-aggregations-sum/problem

select sum(population) from city where district = 'California';

--25. Average_Population  https://www.hackerrank.com/challenges/average-population/problem

select round(avg(population),0) from city;

--26. Japan_Population  https://www.hackerrank.com/challenges/japan-population/problem

select sum(population) from city where countrycode = 'JPN';

--27. The Blunder  https://www.hackerrank.com/challenges/the-blunder/problem

select ceil(avg(salary) - avg(regexp_replace(salary,0,''))) from employees;

--28. Population Density Difference https://www.hackerrank.com/challenges/population-density-difference/problem

select max(population) - min(population) from city;

--29. TopEarners https://www.hackerrank.com/challenges/earnings-of-employees/problem

select salary*months, count(1) from employee where salary*months in (select max(salary*months) m_earn from employee) group by salary*months;

--30. Weather Observation Station 2  https://www.hackerrank.com/challenges/weather-observation-station-2/problem

select round(sum(LAT_N),2), round(sum(LONG_W),2) from station;

--31. Weather_Observation_Station_13  https://www.hackerrank.com/challenges/weather-observation-station-13/problem

select round(sum(LAT_N),4) from station where LAT_N between 38.7880 and 137.2345;

--32. Weather_Observation_Station_14  https://www.hackerrank.com/challenges/weather-observation-station-14/problem

select round(max(LAT_N),4) from station where LAT_N < 137.2345;

--33. Weather_Observation_Station_15  https://www.hackerrank.com/challenges/weather-observation-station-15/problem

select round(LONG_W,4) from station where LAT_N in (select max(LAT_N) from station where LAT_N < 137.2345);

--34. Weather_Observation_Station_16 https://www.hackerrank.com/challenges/weather-observation-station-16/problem

select round(min(LAT_N), 4) from station where LAT_N > 38.7780;

--35. Weather_Observation_Station_17 https://www.hackerrank.com/challenges/weather-observation-station-17/problem

select round(LONG_W,4) from station where LAT_N = (select min(LAT_N) from station where LAT_N > 38.7780);

--36. African_Cities https://www.hackerrank.com/challenges/african-cities/problem

select name from city where CountryCode in (select code from country where lower(continent) = 'africa');

--37. Asian_Population  https://www.hackerrank.com/challenges/asian-population/problem

select sum(population) from city where countrycode in (select code from country where lower(continent) = 'asia');

--38. Average Population_of_Each_Continent  https://www.hackerrank.com/challenges/average-population-of-each-continent/problem

select c.Continent, floor(avg(ci.population))
from country c, city ci
where c.code=ci.CountryCode
group by c.continent;

--39. Draw_The_Triangle_1   https://www.hackerrank.com/challenges/draw-the-triangle-1/problem

set serveroutput on;
declare
x varchar(60);
begin
    for i in reverse 1..20 loop
      select rpad('*',i*2-1,' *') into x from dual;
      dbms_output.put_line(x);
    end loop;
end;
/

--40. Draw_The_Triangle_2  https://www.hackerrank.com/challenges/draw-the-triangle-2/problem

set serveroutput on;
declare
x varchar(60);
begin
    for i in 1..20 loop
      select rpad('*',i*2-1,' *') into x from dual;
      dbms_output.put_line(x);
    end loop;
end;
/



