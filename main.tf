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
  region                      = var.aws_region
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  endpoints {
    ec2 = "http://localhost:4566"
  }
}

resource "random_string" "random" {
  length = 4
  special = false
}
resource "aws_instance" "curso-terraform" {
  ami           = var.ami_instance
  instance_type = var.instance_type

  tags          = {
    Name = "curso-terraform-${var.environment}-${random_string.random.id}"
  }
}
