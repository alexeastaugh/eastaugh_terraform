locals {
  tags = {
    Name        = "eastaugh-${var.infra_env}-${var.infra_role}"
    Role        = var.infra_role
    Environment = var.infra_env
    ManagedBy   = "terraform"
  }
}
