# Codelines
                                                                                                                                     

                                                                                                                                     
## :wave: delete-old-file.sh

*A housekeeping script which can be used for files deletion (eg. implementation of GDPR ) older than specified day.*

    $$ delete-old-file.sh /path/to/files retention_days

                                                                                                                                      
## :wave: flatten-single-json.py

*Flatten a JSON file located in GCP bucket or available locally using python.*

    $$ python flatten-single-json.py

** The function is available over stackoverflow. I modified it to meet my requirement. 
                                                                                                                                      
                                                                                                                                      
## :wave: flatten-dist-json.py

*Flatten single (or, multiple) JSON(s) located on hdfs/cloud bucket using pyspark and python*
+ Pass exclusionList to ignore all the keys not to be expanded/flattened. 
+ Use explode(instead of explode_outer) if you want to ignore records with null in the column. 
     
      $$ python flatten-dist-json.py

## :wave: Commands

*bash*
> check special characters introduced int the script

    $$ cat -vT filename
    $$ vi -b filename

> kubectl

    $$ kubectl config use-context <context>
    $$ kubectl --context=<context> get pods -n <namespace>
    $$ kubectl get secret --context=<context> <secret> -o json
    $$ kubectl config get-clusters 
    $$ kubectl get secret <secret> -o yaml --context <context> --namespace <namespace>
    $$ kubectl --context=<context> get pods -n <namespace>
    $$ kubectl exec -it <pod> --context=<context> -n <namespace> -c <container> -- sh
    
    
## :wave: Create a virtual environment for your work:
    $$ sudo apt-get install -y python3-venv
    $$ python3 -m venv myenv
    $$ source myenv/bin/activate

***let me know, if anything was useful.***    
