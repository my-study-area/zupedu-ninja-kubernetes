resource "random_string" "random" {
  count   = var.ec2_count
  length  = 4
  special = false
  upper   = false
}


resource "aws_instance" "curso-terraform" {
  count = var.ec2_count
  ami = var.ec2_ami
  instance_type = var.ec2_type
  tags = merge(
    local.tags,
    {
      Name = "curso-terraform-${terraform.workspace}-${random_string.random[count.index].id}"
    }
  )
}
