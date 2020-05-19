# codelines
                                                                                                                                     

                                                                                                                                     
## delete-old-file.sh

*A housekeeping script which can be used for files deletion (eg. implementation of GDPR ) older than specified day.*

    $$ delete-old-file.sh /path/to/files retention_days

                                                                                                                                      
## flatten-single-json.py

*Flatten a JSON file located in GCP bucket or available locally using python.*

    $$ python flatten-single-json.py

** The function is available over stackoverflow. I modified it to meet my requirement. 
                                                                                                                                      
                                                                                                                                      
## flatten-dist-json.py

*Flatten single (or, multiple) JSON(s) located on hdfs/cloud bucket using pyspark and python*
+ Pass exclusionList to ignore all the keys not to be expanded/flattened. 
+ Use explode(instead of explode_outer) if you want to ignore records with null in the column. 
     
    $$ python flatten-dist-json.py


                                                                                                                                     
***let me know, if anything was useful.***
