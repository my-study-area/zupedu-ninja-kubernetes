output "ec2_info" {
  value = {for i in aws_instance.curso-terraform[*] : i.tags.Name => join(":", [i.id], i.public_ip[*])}
}
