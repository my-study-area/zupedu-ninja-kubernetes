variable "aws_region" {
  type = string
  description = "aws region"
  default = "us-east-1"
}

variable "ami_instance" {
  type = string
  default = "ami=0c2b8ca1dad447f8a"
}

variable "instance_type" {
  type = string
  default = "t3-micro"
}

variable "tags" {
  type = map
  default = {
    Name = "curso-terraform"
    Environment = "dev"
  }
}

variable "environment" {
  type = string
  default = "dev"
}
