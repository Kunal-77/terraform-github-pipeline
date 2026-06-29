resource "aws_iam_role" "ec2_role" {
  name = "centralized-monitoring-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "centralized-monitoring-instance-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_cloudwatch_log_group" "monitoring_logs" {
  name              = "/aws/ec2/centralized-monitoring"
  retention_in_days = 7
}

resource "aws_instance" "monitoring_server" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name        = var.instance_name
    Environment = "Production"
  }
}

resource "aws_cloudwatch_dashboard" "monitoring_dashboard" {
  dashboard_name = "centralized-monitoring-dashboard"

  dashboard_body = jsonencode({
    widgets = []
  })
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "HighCPUAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when CPU exceeds 80%"
}

