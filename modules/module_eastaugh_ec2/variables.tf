variable "infra_env" {
  type        = string
  description = "Infrastructure environment"
}

variable "infra_role" {
  type        = string
  description = "infrastructure purpose"
}

variable "instance_size" {
  type        = string
  description = "ec2 web server size"
  default     = "t2.micro"
}

variable "instance_ami" {
  type        = string
  description = "Server image to use"
}

variable "instance_root_device_size" {
  type        = number
  description = "Root bock device size in GB"
  default     = 12
}

variable "subnets" {
  type        = list(string)
  description = "Valid subnets to assign to instance"
}

variable "security_groups" {
  type        = list(string)
  description = "Security groups to assign to instance"
  default     = []
}

variable "create_eip" {
  type = bool
  default = false
  description = "whether to create an EIP for the ec2 instance or not"
}