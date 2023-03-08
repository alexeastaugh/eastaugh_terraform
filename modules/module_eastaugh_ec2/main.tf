resource "random_shuffle" "subnets" {
  input        = var.subnets
  result_count = 1
}
resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_size

  root_block_device {
    volume_size = var.instance_root_device_size
    volume_type = "gp3"
  }

  subnet_id              = random_shuffle.subnets.result[0]
  vpc_security_group_ids = var.security_groups

  lifecycle {
    create_before_destroy = false
  }

  tags = local.tags
}

resource "aws_eip" "eastaugh_addr" {
  vpc = true

  // Change this to a function so that it prevents a destroy only if its live
  lifecycle {
    prevent_destroy = false
  }

  tags = local.tags
}

// Seperate resource to associate eip so that it doesnt get removed by mistake
resource "aws_eip_association" "eip_assoc" {
  count = (var.create_eip) ? 1 : 0

  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.eastaugh_addr.id
}