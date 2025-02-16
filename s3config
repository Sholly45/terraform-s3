terraform {
  required_version = ">= 1.10.5"  # Ensures Terraform version compatibility

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"  # Compatible with Terraform v1.10.5
    }
  }
}

provider "aws" {
  region = "eu-west-2"  # Adjust to your desired AWS region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-yaweh1234"  # Ensure uniqueness globally

  # Terraform AWS provider v5+ requires object ownership to be controlled separately
  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}

# Enforce bucket ownership controls (Required in AWS Provider v5+)
resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# Block public access to the S3 bucket (Security best practice)
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
