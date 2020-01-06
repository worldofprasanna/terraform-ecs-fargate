terraform {
  required_version = "~> 0.12.18"
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
  shared_credentials_file = "/Users/prasanna/Documents/Code/mine/terraform-ecs-fargate/credentials"
}

module "fargate" {
  source = "git::https://github.com/strvcom/terraform-aws-fargate.git?ref=tags/0.17.0"
  name = "hello"
  services = {
    nginx = {
      task_definition = "nginx.json"
      container_port  = 80
      cpu             = "256"
      memory          = "512"
      replicas        = 3

      health_check_interval = 100             # Optional. In seconds. 30 by default
      health_check_path     = "/" # Optional. "/" by default
    }
  }
}
