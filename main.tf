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
  count   = local.container_count
  length  = 4
  special = false
  upper   = false
}
resource "aws_instance" "curso-terraform" {
  count = local.container_count
  ami           = var.ami_instance
  instance_type = var.instance_type

  tags          = merge(
    local.tags,
    {
      Name = "curso-terraform-${var.environment[count.index]}-${random_string.random[count.index].id}"
    }
  )
}
