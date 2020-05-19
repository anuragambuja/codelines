from pyspark.sql.functions import col, explode_outer
from pyspark.sql.types import StructType, ArrayType

def flatten(df, exc_flat=list()):
    complex_fields = dict([(field.name, field.dataType)
                           for field in df.schema.fields
                           if (type(field.dataType) == ArrayType or type(field.dataType) == StructType)
                               and (field.name not in exc_flat)])
    
    while len(complex_fields)!=0:
        col_name=list(complex_fields.keys())[0]

        if (type(complex_fields[col_name]) == StructType):
            expanded = [col(col_name+'.'+k).alias(col_name+'_'+k) 
                        for k in [ n.name for n in  complex_fields[col_name]]]
            df=df.select("*", *expanded).drop(col_name)

        elif (type(complex_fields[col_name]) == ArrayType):    
            df=df.withColumn(col_name,explode_outer(col_name))

        # recompute remaining Complex Fields in Schema       
        complex_fields = dict([(field.name, field.dataType)
                             for field in df.schema.fields
                             if (type(field.dataType) == ArrayType or type(field.dataType) == StructType)
                               and (field.name not in exc_flat)])
    
    return df


df = sqlContext.read.json("gs://path/to/file/*.json")

exclusionList = ["cols", "to", "be", "excluded"]
flatten(df, exclusionList)



