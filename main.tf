# Specify the provider and access details
provider "aws" {
  region = "ap-southeast-2"
}

# Create s3 bucket
resource "aws_s3_bucket" "prod" {
  bucket = "jasonsoo-test2"
  acl = "private"
}