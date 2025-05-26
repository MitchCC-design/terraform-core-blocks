# Terraform Core Blocks

This project demonstrates all fundamental block types in Terraform using HashiCorp Configuration Language (HCL).

## Included Terraform Blocks

- **terraform**: Specifies required Terraform version and AWS provider.
- **provider**: Configures AWS region.
- **resource**: Defines an S3 bucket to be managed.
- **data**: References an existing, unmanaged S3 bucket.
- **variable**: Declares a configurable input with a default.
- **output**: Prints the ID of the created S3 bucket.
- **locals**: Defines a temporary value used internally.
- **module**: References a local reusable Terraform module.

## Purpose

This is an instructional example meant to illustrate Terraform's syntax and structure. It is not intended to be applied in a real environment.

## Files

- `hcl.tf`: Contains all core block examples.
- `.gitignore`: Ensures state files and secrets are not tracked.

## Usage

This project is for reference only. No deployment is required.

Optional validation steps:

```bash
terraform init
terraform validate