output "app_ec2_instance_id" {
  value = aws_instance.app_ec2.id
}

output "imported_ec2_instance_id" {
  value = aws_instance.imported_ec2.id
}

output "count_ec2_instance_ids" {
  value = aws_instance.count_ec2[*].id
}

output "foreach_ec2_instance_ids" {
  value = {
    for key, instance in aws_instance.foreach_ec2 :
    key => instance.id
  }
}
