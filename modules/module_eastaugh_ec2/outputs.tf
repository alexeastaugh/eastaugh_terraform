output "app_eip" {
  value       = aws_eip.eastaugh_addr.*.public_ip
  description = "The public IP address of the web instance"
}

output "app_instance" {
  value       = aws_instance.web.id
  description = "The web instance AWS ID"
}