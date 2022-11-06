// To use this main.tf
// Update variables in variables.tfvars then:
// terraform plan -var-file=variables.tfvars

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"] # Canonical official
}

// VPC Networking
module "vpc" {
  source = "./modules/module_eastaugh_vpc"

  infra_env              = var.infra_env
  vpc_cidr               = "10.0.0.0/17"
  public_subnet_numbers  = { "eu-west-1a" = 1 }
  private_subnet_numbers = { "eu-west-1a" = 2 }
}

// Web Application
module "ec2_application" {
  source = "./modules/module_eastaugh_ec2"

  infra_env       = var.infra_env
  infra_role      = "web"
  instance_size   = "t3.micro"
  instance_ami    = data.aws_ami.ubuntu.id
  subnets         = keys(module.vpc.vpc_public_subnets)
  security_groups = [module.vpc.security_group_public]
  create_eip      = true
}