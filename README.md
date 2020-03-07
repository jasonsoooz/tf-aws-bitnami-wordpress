# tf-aws-bitnami-wordpress

This project is based on helpful **AWS** projects   
https://github.com/terraform-providers/terraform-provider-aws.git (examples/two-tier)  
https://github.com/davidjeddy/wordpress-terraform

This project uses **Terraform** to automatically create a **Bitnami Wordpress EC2** server 
instance.  It also creates associated objects that EC2 needs to run.  Eg: 
- Virtual Private Cloud (VPC)
- subnet
- security group
- ssh key pair, etc.

### Pre-reqs
1. Install Terraform on your machine
2. Create AWS access keys linked to IAM user
3. Generate **ssh key** pair

```
# 1. Generate ssh key pair (use rsa 4096 as ed25519 is not available on aws)
# eg private key = aws_terraform_id_rsa
#    public key = aws_terraform.pub
$ ssh-keygen -t rsa -b 4096 -C "<email>"

# 2. Place key pair in ~/.ssh

# 3. Use this key pair when running terraform
# eg key = aws_terraform
     public key = ~/.ssh/aws_terraform.pub
```

### Installing terraform changes

Terraform will only create the aws **EC2** instance running
**Wordpress**.  There are still some **manual** steps required
to configure Wordpress **after** running Terraform.

We will use **local** terraform rather than **docker-compose** as 
its easier to use local .ssh keys rather than passing into
docker.


```
# export aws access keys as environment variables
$ export AWS_ACCESS_KEY_ID="<access key>"
$ export AWS_SECRET_ACCESS_KEY="<secret access key>"

$ terraform init
$ terraform plan
$ terraform apply

# When you want to remove resources
$ terraform destroy

# Get wordpress admin credentials
EC2 Actions -> Instance Settings -> Get System Log = get password
```

### Manual Wordpress config after Terraform changes

For details, see aws local notes  

1. Install **https before** login with admin user
2. **Restore** Wordpress site: eg by installing backup / restore plugin (UpdraftPlus Backup/Restore)
3. Hide **bitnami manage** banner
4. **Check**: Wordpress version & required updates

## Misc notes

### ssh key generation options
```
# Unfortunately, aws doesn't allow ed25519,
# so we'll use rsa. rsa is safe >= 3072
$ ssh-keygen -t rsa -b 4096

# This is the new recommendation, but may 
# not be widely available
$ ssh-keygen -t ed25519

# Developed by NIST, suspicious of NSA backdoors
# Depends on how well your machine can generate a
# random number used to create signature
$ ssh-keygen -t ecdsa -b 521

# Avoid dsa, considered unsafe
$ ssh-keygen -t dsa
```

## Docker compose

For projects where local setup is not required, docker-compose is the preferred
option.  
https://github.com/contino/docker-terraform#configuration

```
# Check terraform version
$ docker-compose run terraform --version

# export aws access keys as environment variables
$ export AWS_ACCESS_KEY_ID="<access key>"
$ export AWS_SECRET_ACCESS_KEY="<secret access key>"

$ docker-compose run terraform init
$ docker-compose run terraform plan
$ docker-compose run terraform apply

# When you want to remove resources
$ docker-compose run terraform destroy
```