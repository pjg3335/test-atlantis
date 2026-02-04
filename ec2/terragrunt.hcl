remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "terraform-state-pjg3335"
    key            = "atlantis-test/ec2/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

terraform {
  source = "."
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_subnet_id = "subnet-12345678"
  }
}

inputs = {
  subnet_id = dependency.vpc.outputs.vpc_subnet_id
}