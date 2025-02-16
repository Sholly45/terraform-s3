# Define the AWS provider
provider "aws" {
  region = "eu-west-2"  # Change to your AWS region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345"  # Use a unique bucket name

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}

# Set ACL for the bucket
resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"
}
