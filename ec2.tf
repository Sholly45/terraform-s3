provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins_demo" {
  ami           = "ami-03a725ae7d906005d" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  
  key_name      = "hush"  # Using existing key pair
  security_groups = ["mysg"]  # Using existing security group

  tags = {
    Name = "jenkins-terraform-demo"
  }
}

output "instance_id" {
  value = aws_instance.jenkins_demo.id
}

