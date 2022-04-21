terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  endpoints {
    ec2 = "http://localhost:4566"
  }
}

resource "aws_instance" "curso-terraform" {
  ami           = "ami=0c2b8ca1dad447f8a"
  instance_type = "t3.micro"

  tags = {
    Name = "curso-terraform"
  }
}
