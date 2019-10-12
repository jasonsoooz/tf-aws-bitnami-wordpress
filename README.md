# tf-aws-bitnami-wordpress

Use **docker-compose** to execute Terraform commands
to apply to AWS.
https://github.com/contino/docker-terraform#configuration

This is beneficial as we don't have to install Terraform 
on our system to use it. 

Initially we'll just create a **test S3 bucket** to check 
our Terraform AWS connection.  Once this works, we'll
create the **EC2 wordpress** instance next.

### Pre-reqs
1. Create AWS access key linked to IAM user

Set the access keys as environment variables that can be
fed into docker container. 

```
# Check terraform version
$ docker-compose run terraform --version

# export aws access keys as environment variables
$ export AWS_ACCESS_KEY_ID="<access key>"
$ export AWS_SECRET_ACCESS_KEY="<secret access key>"

$ docker-compose run terraform init
$ docker-compose run terraform plan
$ docker-compose run terraform apply
```