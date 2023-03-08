locals {
  common_tags = {
    Environment = var.infra_env
    ManagedBy   = "terraform"
  }
}