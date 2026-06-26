output "instance_id" {
  value = aws_instance.validation_server.id
}

output "public_ip" {
  value = aws_instance.validation_server.public_ip
}
