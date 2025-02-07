# Terragrunt Infrastructure Repository

This repository demonstrates the use of Terragrunt to manage AWS infrastructure with a modular structure.

## Repository Structure

- **bootstrap/**  
  Contains the Terragrunt configuration that bootstraps the environment by creating an S3 bucket for Terraform state storage.

- **environments/**  
  Contains environment-specific configurations (e.g., dev, stage, prod).  
  Example: `environments/dev/terragrunt.hcl` defines an EC2 instance resource for the dev environment.

- **modules/**  
  - **ec2.tf**: Consolidated module file that defines the EC2 instance resource along with its variables and outputs.
  - **s3/**: Contains the S3 module (`s3.tf`) used for creating a Terraform state backend S3 bucket.

- **.gitignore**  
  Configuration file to exclude local Terraform and Terragrunt files.

## Usage

1. Customize the configuration values (e.g., AMI IDs, instance types, bucket names) as needed.
2. Run `terragrunt init` in the target environment directory (e.g., `environments/dev`) to initialize Terragrunt.
3. Use `terragrunt plan` and `terragrunt apply` to preview and apply changes.

## Inheritance with Terragrunt

The `include` block in a child `terragrunt.hcl` file:

```hcl
include {
  path = find_in_parent_folders()
}
```

allows you to inherit common settings (e.g., backend configuration, shared inputs) from a parent configuration, typically defined at the repository root.