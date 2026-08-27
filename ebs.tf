resource "aws_ebs_volume" "ec2_data" {
  for_each = {
    app      = aws_instance.app_ec2.id
    imported = aws_instance.imported_ec2.id
    count_0  = aws_instance.count_ec2[0].id
    count_1  = aws_instance.count_ec2[1].id
    dev      = aws_instance.foreach_ec2["dev"].id
    test     = aws_instance.foreach_ec2["test"].id
  }

  availability_zone = "us-east-1c"
  size              = 1
  type              = "gp3"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name      = "Data-${each.key}"
    ManagedBy = "Terraform"
  }
}

resource "aws_volume_attachment" "ec2_data" {
  for_each = {
    app      = aws_instance.app_ec2.id
    imported = aws_instance.imported_ec2.id
    count_0  = aws_instance.count_ec2[0].id
    count_1  = aws_instance.count_ec2[1].id
    dev      = aws_instance.foreach_ec2["dev"].id
    test     = aws_instance.foreach_ec2["test"].id
  }

  device_name = "/dev/sdf"

  volume_id = aws_ebs_volume.ec2_data[each.key].id

  instance_id = each.value
}