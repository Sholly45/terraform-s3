provider "aws" {
  region     = "eu-west-2"  # Change region as required
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "jenkins-terraform-bucket-demo"
  acl    = "private"
  
  tags = {
    Name        = "Jenkins Terraform S3 Bucket"
    Environment = "Dev"
  }
}
