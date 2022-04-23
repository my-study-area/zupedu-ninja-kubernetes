output "instance_p_addr" {
  value = aws_instance.curso-terraform.public_ip
}

output "instance_name" {
  value = aws_instance.curso-terraform.tags.Name
}
