#resources created are test once :)

resource "aws_instance" "imported_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  #vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name        = "Imported-EC2"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}


resource "aws_instance" "app_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  #vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 8
    delete_on_termination = true
  }

  associate_public_ip_address = false

  tags = {
    Name        = "Local-EC2"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}


resource "aws_instance" "count_ec2" {
  count = 2

  ami           = var.ami_id
  instance_type = var.instance_type
  #vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name        = "Count-EC2-${count.index}"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_instance" "foreach_ec2" {
  for_each = {
    dev  = "Dev-EC2"
    test = "Test-EC2"
  }

  ami           = var.ami_id
  instance_type = var.instance_type
  #vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name        = each.value
    Environment = each.key
    ManagedBy   = "Terraform"
  }
}