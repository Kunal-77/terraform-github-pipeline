output "instance_id" {
  value = aws_instance.github_runner.id
}

output "public_ip" {
  value = aws_instance.github_runner.public_ip
}

