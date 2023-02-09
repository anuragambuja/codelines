
-- 1. OLAP Performance https://www.hackerrank.com/challenges/olap-performance/problem
Aggregation

-- 2. OLAP Operations - 2  https://www.hackerrank.com/challenges/olap-operations-2/problem
pivot

-- 3. OLAP Cube Metadata  https://www.hackerrank.com/challenges/olap-cube-metadata/problem
Both star and snowflake schema(s)

-- 4. OLAP Name(s)  https://www.hackerrank.com/challenges/olap-names/problem
Multidimensional Cube, HyperCube

-- 5. OLAP Operations - 1 https://www.hackerrank.com/challenges/olap-operations-1/problem
roll-up

-- 6. OLAP Operation Types  https://www.hackerrank.com/challenges/olap-operation-types-2/problem
(4, 7, 3, 84, 160, 117)

-- 7. The Total View  https://www.hackerrank.com/challenges/the-total-view/problem
Data Warehousing

-- 8. Map Reduce Advanced - Relational Join : https://www.hackerrank.com/challenges/map-reduce-advanced-relational-join/problem
def mapper(record):
    #Start writing the Map code here
    words = record.rstrip().split(',')
    if words[0]=='Department':
        mapReducer.emitIntermediate(words[1],('D',words[2]))
    elif words[0]=='Employee':
        mapReducer.emitIntermediate(words[2],('P',words[1]))

def reducer(key, list_of_values):
    #Start writing the Reduce code here
    list_of_values.sort()
    name = list_of_values[-1][-1]
    for d in list_of_values:
        if d[0]!='P':
            mapReducer.emit((key,name, d[-1]))
         
-- 9. Map Reduce Advanced - Count number of friends   https://www.hackerrank.com/challenges/map-reduce-advanced-count-number-of-friends/problem
 def mapper(record):
    #Start writing the Map code here
    friends = record.split()
    mapReducer.emitIntermediate(friends[0], friends[1])
    mapReducer.emitIntermediate(friends[1], friends[0])

def reducer(key, list_of_values):
    #Start writing the Reduce code here
    mapReducer.emit((key, len(list_of_values)))
                              
-- 10. Map Reduce Advanced - Matrix Multiplication  https://www.hackerrank.com/challenges/map-reduce-advanced-matrix-multiplication/problem
 def mapper(A, B):
    A = list(map(list, A))       
    B = list(map(list, zip(*B))) 
    for i, row in enumerate(A):
        for j, col in enumerate(B):
            for vector in row, col:
                mapReducer.emitIntermediate( (i,j), vector )
                
def reducer(key, vectors):
    mapReducer.emit( key + (sum(a*b for a,b in zip(*vectors)),) )

-- 11. Querying XML Datastores with XPath - 9  https://www.hackerrank.com/challenges/querying-xml-datastores-with-xpath-9/problem
puts doc.elements.each("collection/movie[@shelf='B'][2]/@title")

-- 12. Database Normalization #3 https://www.hackerrank.com/challenges/database-normalization-3
3                       
                            
-- 13. Database Normalization #5  https://www.hackerrank.com/challenges/database-normalization-5/problem
3
                            
-- 14. Database Normalization #9  https://www.hackerrank.com/challenges/database-normalization-9/problem
2
                            
                            
                            
