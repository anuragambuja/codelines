--1.  15 Days of Learning SQL - https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem

select t.submission_date, t.cnt, b.hacker_id, b.name
from 
(select submission_date, count(distinct hacker_id) as cnt
from 
(select s.*, dense_rank() over(order by submission_date) as date_rank, 
dense_rank() over(partition by hacker_id order by submission_date) as hacker_rank 
from submissions s ) a 
where date_rank = hacker_rank 
group by submission_date
) t , 
(select submission_date, hacker_id, name 
from 
 (
select f.submission_date, f.name, f.hacker_id, row_number() over(partition by f.submission_date order by f.cnt desc, f.hacker_id asc) rnk from
(
    select s.submission_date , s.hacker_id , h.name, count(1) cnt
    from submissions s , hackers h
    where s.hacker_id = h.hacker_id
    group by s.submission_date, s.hacker_id, h.name
) f
)
where rnk =1) b
where t.submission_date = b.submission_date
order by submission_date;

--2. Interviews  https://www.hackerrank.com/challenges/interviews/problem


