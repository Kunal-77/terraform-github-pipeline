variable "instance_name" {
  default = "enterprise-github-runner-server"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  description = "Amazon Linux 2023 AMI ID"
  default     = "ami-02ceb2e55121f4de6"
}

