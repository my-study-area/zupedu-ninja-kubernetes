output "instance_p_addr" {
  value = aws_instance.curso-terraform.*.public_ip
}

output "instance_name" {
  value = aws_instance.curso-terraform.*.tags.Name
}

output "bucket_domain" {
  value = {for k,v in aws_s3_bucket.s3-bucket : k => v.bucket_domain_name}
}
