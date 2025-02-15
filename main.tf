# main.tf - Terraform configuration file for S3 bucket

provider "aws" {
  region = "eu-west-2"  # Change to your preferred AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345"  # Use a globally unique name
  acl    = "private"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}
