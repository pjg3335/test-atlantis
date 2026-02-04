terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

variable "subnet_id" {
  type = string
}

resource "aws_instance" "web" {
  ami           = "ami-0092e0c93f74c293a"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id

  tags = { Name = "atlantis-test-ec2" }
}