variable "app_name" {
  description = "application name"
  type        = string
  default     = "chatbot"
}

variable "region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "ap-northeast-1"
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "lambda_function"
}
