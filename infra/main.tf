terraform {
  required_version = "=1.8.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "iam" {
  source   = "./modules/iam"
  app_name = var.app_name
}

module "lambda" {
  source               = "./modules/lambda"
  app_name             = var.app_name
  lambda_iam_role      = module.iam.iam_for_lambda_arn
  lambda_function_name = var.lambda_function_name
  sns_topic_arn        = module.sns.sns_arn
}

module "sns" {
  source   = "./modules/sns"
  app_name = var.app_name
}


