## Terraform Override 
This is a simple example of how we can over ride variables in terraform by using the override file.

No matter what value we have in our resource block definition *(in this case, instance_type is t3.2xlarge)* terraform will **override** that with the value we declared in override.tf *(in this case, t2.micro)*

You can run `terraform plan` and see the outcome showing `t2.micro` for `intance_type`