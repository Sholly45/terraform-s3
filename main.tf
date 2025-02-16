terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"  # Ensure Terraform uses a version that supports object_ownership
    }
  }
}

provider "aws" {
  region = "eu-west-2"  # Change to your AWS region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-yaweh1234"  # Use a globally unique bucket name

  # Ensure Terraform is using AWS Provider >= 4.0 before enabling this feature
  object_ownership = "BucketOwnerEnforced"  # Enforces ownership and removes ACL dependency

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}
