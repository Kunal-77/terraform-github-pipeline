resource "aws_iam_role" "ec2_role" {
  name = "secure-production-ec2-role"

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
  name = "secure-production-instance-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_cloudwatch_log_group" "production_logs" {
  name              = "/aws/ec2/secure-production"
  retention_in_days = 7
}

resource "aws_instance" "secure_production_server" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name        = var.instance_name
    Environment = "Production"
  }
}
