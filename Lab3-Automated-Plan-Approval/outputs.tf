output "instance_id" {
  value = aws_instance.plan_approval_server.id
}

output "public_ip" {
  value = aws_instance.plan_approval_server.public_ip
}
