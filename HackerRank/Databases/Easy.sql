-- 1. Basics of Sets and Relations #1  https://www.hackerrank.com/challenges/basics-of-sets-and-relational-algebra-1/problem
8

-- 2. Basics of Sets and Relations #2 https://www.hackerrank.com/challenges/basics-of-sets-and-relational-algebra-2/problem
5

-- 3. Basics of Sets and Relations #3  https://www.hackerrank.com/challenges/basics-of-sets-and-relational-algebra-3/problem
1

-- 4. Basics of Sets and Relations #4  https://www.hackerrank.com/challenges/basics-of-sets-and-relational-algebra-4/problem
42
 
-- 5. Basics of Sets and Relations #5  https://www.hackerrank.com/challenges/basics-of-sets-and-relational-algebra-5/problem
2

-- 6. Basics of Sets and Relations #6  https://www.hackerrank.com/challenges/basics-of-sets-and-relational-algebra-6/problem
 2
 
 -- 7. Basics of Sets and Relations #7  https://www.hackerrank.com/challenges/basics-of-sets-and-relational-algebra-7/problem
2

-- 8. Relational Algebra - 3  https://www.hackerrank.com/challenges/relational-algebra-3/problem
Equijoins

-- 9. Relational Algebra - 4  https://www.hackerrank.com/challenges/relational-algebra-4/problem
Left to right

-- 10. Database Query Languages  https://www.hackerrank.com/challenges/database-query-languages/problem
Query

-- 11. Procedural Language  https://www.hackerrank.com/challenges/procedural-language/problem
Relational algebra

-- 12. Relations - 1  https://www.hackerrank.com/challenges/relations-1/problem
Join

-- 13. Relations - 2  https://www.hackerrank.com/challenges/relations-2/problem
Cartesian product

-- 14. Index Architecture Types  https://www.hackerrank.com/challenges/indexes-1/problem
2
 
-- 15. Indexes - 2  https://www.hackerrank.com/challenges/indexes-2/problem
If the table has a clustered index, or the index is on an indexed view, the row locator is the clustered index key for the row.
 
-- 16. Indexes - 3  https://www.hackerrank.com/challenges/indexes-3/problem
A = 1.33B

-- 17. Indexes - 4  https://www.hackerrank.com/challenges/indexes-4/problem
CREATE INDEX index_name</p> <p>ON table_name(column1, column2);</p>

-- 18. Database Normalization #1 - 1NF  https://www.hackerrank.com/challenges/database-normalization-1-1nf/problem
3
5
2

-- 19. Database Normalization #2 - 1/2/3 NF  https://www.hackerrank.com/challenges/database-normalization-123nf/problem
3

-- 20. Database Normalization #4  https://www.hackerrank.com/challenges/database-normalization-4/problem
10

-- 21. Querying XML Datastores with XPath - 1  https://www.hackerrank.com/challenges/querying-xml-datastores-with-xpath-1/problem
puts doc.elements.each("collection/movie/@title")

-- 22. Querying XML Datastores with XPath - 2  https://www.hackerrank.com/challenges/querying-xml-datastores-with-xpath-1-1/problem
puts doc.elements.each("collection/movie/popularity/text()")

-- 23. Querying XML Datastores with XPath - 3  https://www.hackerrank.com/challenges/querying-xml-datastores-with-xpath-3/problem
puts doc.elements.each("collection/movie[popularity < 8]/format/text()")
 
-- 24. Querying XML Datastores with XPath - 4  https://www.hackerrank.com/challenges/querying-xml-datastores-with-xpath-4/problem
puts doc.elements["collection/movie[@title='Trigun']/popularity/text()"]

-- 25. Querying XML Datastores with XPath - 5  https://www.hackerrank.com/challenges/querying-xml-datastores-with-xpath-1-4/problem
puts doc.elements["collection/movie[@title='Transformers']/@shelf"]

-- 26. Querying XML Datastores with XPath - 6  https://www.hackerrank.com/challenges/querying-xml-datastores-with-xpath-6/problem
puts doc.elements.each("/collection/movie[contains(description,'bit')]/@title")

-- 27. Querying XML Datastores with XPath - 7  https://www.hackerrank.com/challenges/querying-xml-datastores-with-xpath-7/problem
puts XPath.match(doc,"sum(collection/movie/popularity) div count(collection/movie/popularity)")
puts XPath.match(doc,"sum(//popularity) div count(//popularity)")

