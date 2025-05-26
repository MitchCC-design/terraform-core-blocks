# This is a Terraform Block that sets up the required version of Terraform and the AWS provider for managing resources in AWS
terraform {
    required_version = ">= 1.0.0"
    
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
}
# Resouce Blocks are used to define the resources that Terraform will manage. 
provider "aws" {
  region = "us-east-2"
}

# Actively managed resources are defined in resource blocks.
# Each resource block has a type and a name, which together form a unique identifier for the resource.
resource "aws_s3_bucket" "my_bucket" { # The type of resource is defined by the first string, and the name of the resource is defined by the second string.
  bucket = var.bucket_name #Identifier
  acl    = "private"
}

# Data Blocks are used to reference existing resources that are not managed by our Terraform project, we only want to use it.
data "aws_s3_bucket" "my_external_bucket" {
  bucket = "not-managed-by-us" #Identifier
}

# Variable Blocks are used to define variables that can be used in the configuration.
variable "bucket_name" { 
  description = "The name of the S3 bucket" 
  type        = string 
  default     = "my-default-bucket-name" # Use this so you don't have to specify a bucket name every time you run Terraform commands.
}

# Output Blocks are used to output values from the configuration, such as the ID of the S3 bucket created by Terraform.
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.id # This output block will print the ID of the S3 bucket created by Terraform.
}

# Locals Blocks are used to create temporary values that can be used in the configuration.
locals {
    bucket_name = "my-local-bucket-name"
}

# Module Blocks are used to create reusable code that can be used to import into the a current configuration.
module "my_module" {
  source = "./modules-example" # This would be a folder containing a Terraform module.
    # The source attribute specifies the location of the module, which can be a local path or a remote source.
}