output "instance_id" {
  value = aws_instance.monitoring_server.id
}

output "public_ip" {
  value = aws_instance.monitoring_server.public_ip
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.monitoring_logs.name
}

output "dashboard_name" {
  value = aws_cloudwatch_dashboard.monitoring_dashboard.dashboard_name
}

output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}

output "iam_role" {
  value = aws_iam_role.ec2_role.name
}
