## Get Started

Do you have Terragrunt installed? [No?](https://terragrunt.gruntwork.io/docs/getting-started/install/)


## Edit Common vars
```HCL
aws_region="us-west-2"
region-az-1="us-west-2a"
region-az-2="us-west-2b"
project="myprojectname"
```

## Edit Security vars
*security_stack/terraform.tfvars*
```HCL
ec2_key_name="myec2keythaticreatedearlier"
```

## Let's Build This
*ok just part of it*  
This should work
```shell
terragrunt apply-all
``` 