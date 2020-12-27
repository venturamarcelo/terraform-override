## Terraform Override Demo 
This is a simple example of how we can over ride variables in terraform by using the override file.

**Problem:** In Terraform we usally declare resources blocks and assign values to the properties fo these resources. Some tools oike [Terraformer](https://github.com/GoogleCloudPlatform/terraformer) help us generate these resources blocks automatically. The resource blocks will have all values defined. You will need to override these values if you need to change them.

**Solution:** We are using override.tf file to change the value of an simple aws ec2 instance type. We have *variables.tf* declaring the variable we will change (instance_type). We have 2 *tfvars* files to assign different values for the same variable: dev.tfvars and prod.tfvars No matter what value we have in our resource block definition *(in this case, instance_type is t3.2xlarge)* terraform will **override** that with the value we declared in override.tf *(in this case, var.instance_type)*

**Steps to reproduce:**  
1. Start terraform environment
    ```
    terraform init
    ```
2. Run terraform plan for *dev*
    ```
    terraform plan -var-file="dev.tfvars"
    ```
    You will notice that the planned value for *instance_type* now is **t3.micro** instead of **t3.2xlarge** declared in the resource block.
3. Run terraform plan for *prod*
    ```
    terraform plan -var-file="prod.tfvars"
    ```
    You will notice that the planned value for *instance_type* now is **t3.medium** instead of **t3.2xlarge** declared in the resource block or the previous **t2.micro** for dev.

You can run incorporate the same solution in the logic of your CI/CD pipeline, either using *tfvars* as showed here or [terraform workspaces](https://www.terraform.io/docs/cloud/workspaces/index.html).