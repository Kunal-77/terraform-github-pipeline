output "instance_id" {
  value = aws_instance.continuous_deployment_server.id
}

output "public_ip" {
  value = aws_instance.continuous_deployment_server.public_ip
}

