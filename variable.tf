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
  type = list
  default = ["dev","prod"]
}

# variable "environment2" {
# }

variable "instance_number" {
  type = object(
    {
      dev = number
      prod = number
    }
  )

  default = {
    dev = 1
    prod = 2
  }
}

variable "instance_type2" {
  type = object(
    {
      dev = string
      prod = string
    }
  )

  default = {
    dev = "t2.micro"
    prod = "t3.micro"
  }
}
