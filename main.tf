# Define the AWS provider
provider "aws" {
  region = "eu-west-2"  # Change to your AWS region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-yaweh1234"  # Ensure this is globally unique

  object_ownership = "BucketOwnerEnforced"  # Enforces ownership and removes ACL dependency

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}
