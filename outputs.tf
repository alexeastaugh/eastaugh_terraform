output "app_eip" {
  value       = module.ec2_application.app_eip
  description = "The public IP address of the web instance"
}