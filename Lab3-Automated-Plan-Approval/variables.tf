variable "aws_region" {
  default = "ap-northeast-1"
}

variable "instance_name" {
  default = "enterprise-plan-approval-server"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  description = "Amazon Linux 2023 AMI ID"
  default     = "ami-02ceb2e55121f4de6"
}

variable "key_name" {
  default = "terraform-plan-approval-key"
}

