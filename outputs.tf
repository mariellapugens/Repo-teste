output "public_ip_address" {
  value = aws_instance.Containero.public_ip
}

output "private_ip_address" {
  value = aws_instance.Containero.private_ip
}

