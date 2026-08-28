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

output "module_test_instance_id" {
  description = "EC2 instance ID created by the test module"
  value       = module.test_ec2.instance_id
}

output "module_dev_instance_id" {
  description = "EC2 instance ID created by the dev module"
  value       = module.dev_ec2.instance_id
}

output "module_app_ec2_instance_id" {
  description = "EC2 instance ID created by the app_ec2 module"
  value       = module.app_ec2_module.instance_id
}