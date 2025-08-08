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
    
> Terraform 

    $$ terraform init
    $$ terraform plan
    $$ terraform apply
    $$ terraform output
    $$ terraform destroy


###### Introduction

1. What is [Terraform](https://www.terraform.io)?
   * open-source tool by [HashiCorp](https://www.hashicorp.com), used for provisioning infrastructure resources
   * supports DevOps best practices for change management
   * Managing configuration files in source control to maintain an ideal provisioning state 
     for testing and production environments
2. What is IaC?
   * Infrastructure-as-Code
   * build, change, and manage your infrastructure in a safe, consistent, and repeatable way 
     by defining resource configurations that you can version, reuse, and share.
3. Some advantages
   * Infrastructure lifecycle management
   * Version control commits
   * Very useful for stack-based deployments, and with cloud providers such as AWS, GCP, Azure, K8S…
   * State-based approach to track resource changes throughout deployments


#### Files

* `main.tf`
* `variables.tf`
* Optional: `resources.tf`, `output.tf`
* `.tfstate`

#### Declarations
* `terraform`: configure basic Terraform settings to provision your infrastructure
   * `required_version`: minimum Terraform version to apply to your configuration
   * `backend`: stores Terraform's "state" snapshots, to map real-world resources to your configuration.
      * `local`: stores state file locally as `terraform.tfstate`
   * `required_providers`: specifies the providers required by the current module
* `provider`:
   * adds a set of resource types and/or data sources that Terraform can manage
   * The Terraform Registry is the main directory of publicly available providers from most major infrastructure platforms.
* `resource`
  * blocks to define components of your infrastructure
  * Project modules/resources: google_storage_bucket, google_bigquery_dataset, google_bigquery_table
* `variable` & `locals`
  * runtime arguments and constants


#### Execution steps
1. `terraform init`: 
    * Initializes & configures the backend, installs plugins/providers, & checks out an existing configuration from a version control 
2. `terraform plan`:
    * Matches/previews local changes against a remote state, and proposes an Execution Plan.
3. `terraform apply`: 
    * Asks for approval to the proposed plan, and applies changes to cloud
4. `terraform destroy`
    * Removes your stack from the Cloud



## :wave: Create a virtual environment for your work:
    $$ sudo apt-get install -y python3-venv
    $$ python3 -m venv myenv
    $$ source myenv/bin/activate
    
> Docker

    $$ 
    $$
    $$
    $$


> ## Configure multiple github accounts in vscode in windows
#### Step 1: Generate SSH Keys for Both Users
```
# For User 1
ssh-keygen -t ed25519 -C "user1@example.com"
# Save as: C:\Users\<yourname>\.ssh\id_ed25519_user1

# For User 2
ssh-keygen -t ed25519 -C "user2@example.com"
# Save as: C:\Users\<yourname>\.ssh\id_ed25519_user2
```
#### Step 2: Add SSH Keys to GitHub Accounts
```
Copy the contents of each public key (e.g. id_ed25519_user1.pub, id_ed25519_user2.pub).
Go to GitHub → Settings → SSH and GPG Keys → Add new key.
```
#### Step 3: Create config File for SSH
Create or edit the file at C:\Users\<yourname>\.ssh\config:
```
# GitHub User 1
Host github-user1
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_user1

# GitHub User 2
Host github-user2
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_user2
```

#### Step 4: Clone Repositories with Matching Hostnames
When cloning repos for each user, use the custom SSH alias from your config:
```
# For User 1
git clone git@github-user1:username1/repo.git

# For User 2
git clone git@github-user2:username2/repo.git
```

#### Step 5: Set Git Config per Project
Within each cloned repository, set the corresponding Git identity:
```
cd repo-user1
git config user.name "User One"
git config user.email "user1@example.com"

cd ../repo-user2
git config user.name "User Two"
git config user.email "user2@example.com"
```

#### Step 6: VS Code Integration
In VS Code:
- Open each repo in a separate workspace or window.
- The Git extension will automatically pick up the local config (user.name/user.email) per repo.
- You can confirm this by running Git: Show Git Output in the VS Code command palette.


***let me know, if anything was useful.***    
