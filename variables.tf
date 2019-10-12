variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.

Example: ~/.ssh/terraform.pub
DESCRIPTION
}

variable "key_name" {
  description = "Desired name of AWS key pair"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-southeast-2"
}

# Created 5 Sep 19: Bitnami Wordpress 5.2.3-0-linux-ubuntu-16.04-x86_64-hvm-ebs-mp
variable "aws_amis" {
  default = {
    ap-southeast-2 = "ami-0978d26087b319775"
  }
}