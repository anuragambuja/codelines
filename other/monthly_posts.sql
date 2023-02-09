"""
Task
Given a posts table that contains a created_at timestamp column write a query that returns a first date of the month, a number of posts created in a given month and a month-over-month growth rate.

The resulting set should be ordered chronologically by date.

Note:

percent growth rate can be negative
percent growth rate should be rounded to one digit after the decimal point and immediately followed by a percent symbol "%". See the desired output below for the reference.
Desired Output
The resulting set should look similar to the following:

date       | count | percent_growth
-----------+-------+---------------
2016-02-01 |   175 |           null
2016-03-01 |   338 |          93.1%
2016-04-01 |   345 |           2.1%
2016-05-01 |   295 |         -14.5%
2016-06-01 |   330 |          11.9%
...
date - (DATE) a first date of the month
count - (INT) a number of posts in a given month
percent_growth - (TEXT) a month-over-month growth rate expressed in percents
Testing Info
Dynamic Table Data
The data within each table is re-generated each time you submit. Do not expect to get the same data back twice.

In order to check accuracy of results, make sure to compare the actual results to the expected.

Test Errors
Tests are done using Ruby, which is why you may see some non-SQL looking errors if something isn't correct

"""


with monthly_posts as (
  select cast(date_trunc('month', created_at) as date) date , count(1) count
  from posts
  group by date
)
select date, count
,case when lag(count) over (order by date) is not null then concat(cast(round(cast((cast((count - lag(count) over (order by date)) as float)/(lag(count) over (order by date)))*100 as numeric), 1) as text), '%')
else null end percent_growth
from monthly_posts
order by date
;

