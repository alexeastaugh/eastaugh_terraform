variable "public_subnet_numbers" {
  type        = map(number)
  description = "Map AZ to a number which will be used for public subnets"
  default = {
    "eu-west-1a" = 1
    "eu-west-1b" = 2
    "eu-west-1c" = 3
  }
}

variable "private_subnet_numbers" {
  type        = map(number)
  description = "Map AZ to a number which will be used for private subnets"
  default = {
    "eu-west-1a" = 4
    "eu-west-1b" = 5
    "eu-west-1c" = 6
  }
}

variable "vpc_cidr" {
  type        = string
  description = "The IP range to use for the VPC"
  default     = "10.0.0.0/16"
}

variable "infra_env" {
  type        = string
  description = "Infrastructure environment"
}