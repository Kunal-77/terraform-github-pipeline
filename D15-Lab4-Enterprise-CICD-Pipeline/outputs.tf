output "instance_id" {
  value = aws_instance.cicd_server.id
}

output "public_ip" {
  value = aws_instance.cicd_server.public_ip
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.cicd_logs.name
}

output "iam_role" {
  value = aws_iam_role.ec2_role.name
}
