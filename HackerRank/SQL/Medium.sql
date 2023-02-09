--1. The_PADS   https://www.hackerrank.com/challenges/the-pads/problem

select concat(concat(name,'('),concat(substr(occupation,1,1),')')) from occupations order by name asc;
select concat(concat('There are a total of ', count(1)),concat(' ',concat(lower(occupation), 's.'))) from occupations group by occupation order by count(occupation), occupation;

--2. Occupations  https://www.hackerrank.com/challenges/occupations/problem

select doc, prof, sin, act from 
(select row_number() over (partition by occupation order by name) rn,
        name, 
        occupation
from occupations) 
pivot (max(name) for occupation in ('Doctor' as doc, 
                                    'Professor' as prof, 
                                    'Singer' as sin, 
                                    'Actor' as act))
order by rn;

--3. Binary_Tree_Nodes  https://www.hackerrank.com/challenges/binary-search-tree-1/problem

select N,case
    when P is null then 'Root'
    when N in (select distinct P from BST) then 'Inner'
    else 'Leaf'
    end val
from BST
order by N;

--4. Weather_Observation_Station_18   https://www.hackerrank.com/challenges/weather-observation-station-18/problem 

select round((max(LAT_N) - min(LAT_N) + max(LONG_W) - min(LONG_W)), 4) from station;

--5. Weather_Observation_Station_19 https://www.hackerrank.com/challenges/weather-observation-station-19/problem

select round(sqrt((a-b)*(a-b)+(c-d)*(c-d)), 4)
from (select min(LAT_N) a, max(LAT_N) b, min(LONG_W) c, max(LONG_W) d from station);

--6. Weather_Observation_Station_20   https://www.hackerrank.com/challenges/weather-observation-station-20/problem

select round(median(LAT_N),4) from station;

--7. New Companies -  https://www.hackerrank.com/challenges/the-company/problem

select c.company_code, c.founder, count(distinct l.lead_manager_code),  count(distinct s.senior_manager_code),  count(distinct m.manager_code),  count(distinct e.employee_code) 
from company c
left join lead_manager l 
on c.company_code = l.company_code
left join senior_manager s
on l.lead_manager_code = s.lead_manager_code
left join manager m
on s.senior_manager_code = m.senior_manager_code
left join employee e
on m.manager_code = e.manager_code
group by c.company_code, c.founder order by c.company_code;

--8. The Report  https://www.hackerrank.com/challenges/the-report/problem

select case when grade > 7 then s.name
            else NULL
        end name, grade, marks
from grades g, students s
where s.marks between min_mark and max_mark
order by grade desc,name, marks asc;

--9. Top Competitors  https://www.hackerrank.com/challenges/full-score/problem

select h.hacker_id, h.name
from submissions s, challenges c, difficulty d, hackers h
where s.challenge_id = c.challenge_id 
      and c.difficulty_level = d.difficulty_level
      and s.score = d.score 
      and s.hacker_id = h.hacker_id
group by h.hacker_id, h.name
having count(*)>1
order by count(*) desc, h.hacker_id;

--10. Ollivander's Inventory  https://www.hackerrank.com/challenges/harry-potter-and-wands/problem

select id, age, coins_needed, power 
from (select w.id, p.age, w.coins_needed, w.power
, rank() over (partition by w.power, p.age order by w.coins_needed ) rnk
from wands w, wands_property p
where p.is_evil = 0 and p.code = w.code
) 
where rnk =1
order by power desc, age desc;

--11. Challenges https://www.hackerrank.com/challenges/challenges/problem

select hacker_id, name, cnt 
from 
(select h.hacker_id, h.name, count(1) cnt
from hackers h, challenges c
where h.hacker_id = c.hacker_id 
group by h.hacker_id, h.name) x
where cnt in (select ct from (select ct, count(*) cst from (select hacker_id, count(*) ct from challenges group by hacker_id) group by ct) where cst =1 ) or cnt in (select max(ct) from (select count(*) ct from challenges group by hacker_id))
order by cnt desc, hacker_id asc;

--12. Contest Leaderboard  https://www.hackerrank.com/challenges/contest-leaderboard/problem

select s.hacker_id, h.name, s.tot
from 
(select hacker_id, sum(scores) tot
 from 
(select hacker_id, max(score) scores
from submissions
group by hacker_id, challenge_id)
group by hacker_id) s, hackers h
where (s.hacker_id = h.hacker_id) and (s.tot > 0)
order by s.tot desc, s.hacker_id;

--13. SQL Project Planning   https://www.hackerrank.com/challenges/sql-projects/problem

SELECT start_date, MIN(end_date)
FROM 
    (SELECT start_date FROM PROJECTS WHERE start_date NOT IN (SELECT end_date FROM PROJECTS)) a,
    (SELECT end_date FROM PROJECTS WHERE end_date NOT IN (SELECT start_date FROM PROJECTS)) b
where start_date < end_date
GROUP BY start_date
ORDER BY to_date(start_date) - to_date(MIN(end_date)) desc, start_date;

--14.  Placements  https://www.hackerrank.com/challenges/placements/problem

select name
from (
select st.name, st.sal, st.fid, pt.salary fsal
from (select s.name name, p.salary sal, f.friend_id fid
      from students s, packages p, friends f 
      where s.id = p.id and s.id=f.id
     ) st, packages pt
where st.fid = pt.id
    )
where fsal > sal 
order by fsal;
     
--15.  Symmetric Pairs  https://www.hackerrank.com/challenges/symmetric-pairs/problem

select a.x, a.y
from 
(select x, y, row_number() over (order by x) rn from functions) a, 
(select x, y, row_number() over (order by x) rn from functions) b
where a.x=b.y and a.y=b.x and a.rn < b.rn
order by a.x;

--16. Print Prime Numbers  https://www.hackerrank.com/challenges/print-prime-numbers/problem





