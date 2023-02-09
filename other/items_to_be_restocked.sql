"""
Task
Find what products need restocking from CompanyA. An item needs restocking if there are only 2 or less of it left in stock.

Order the results by products id.

Table Schema
products
A table of products, including their price, amount of stock and company they are from

NAME	TYPE
id	INT
name	VARCHAR(100)
price	DECIMAL
stock	INT
producent	TEXT
Query Schema
resulting query
The query of items that need to be restocked

NAME	TYPE
id	INT
name	VARCHAR(100)
stock	INT

"""


select id, name, sum(stock) stock
from products
where producent = 'CompanyA'
group by id, name
having sum(stock) <= 2
order by id
;
