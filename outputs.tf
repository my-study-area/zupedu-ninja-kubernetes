# output "instance_p_addr" {
#   value = aws_instance.curso-terraform.*.public_ip
# }

# output "instance_name" {
#   value = aws_instance.curso-terraform.*.tags.Name
# }

# output "bucket_domain" {
#   value = {for k,v in aws_s3_bucket.s3-bucket : k => v.bucket_domain_name}
# }

# output "names" {
#   value = join(", ", aws_instance.instancia-fuctions.*.tags.Name)
# }


# output "instance_data_source" {
#   value = aws_instance.instance-data-source.tags.Name
# }

# output "instance_worspace" {
#   value = aws_instance.instance-workspace.*.tags.Name
# }
