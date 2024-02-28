terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "PROFILE"
}

resource "aws_instance" "bia-dev" {
  ami = "ami-02f3f602d23f1659d"
  instance_type = "t3.micro"
  tags = {
    Name = "bia-terraform"
  }
  vpc_security_group_ids = [ "SECURITY_GROUP" ]
  user_data = file("userdata.sh")
  iam_instance_profile = "ROLE"
}