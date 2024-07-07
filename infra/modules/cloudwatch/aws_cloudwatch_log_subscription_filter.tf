resource "aws_cloudwatch_log_subscription_filter" "lambda_trigger" {
  name           = "ErrorLogsToLambda"
  log_group_name = var.webserver_log_group_name
  # filter_pattern  = "{ $.level = \"error\" || $.level = \"fatal\" }"
  filter_pattern  = ""
  destination_arn = var.lambda_function_arn

  # depends_on = [module.lambda.aws_lambda_permission.allow_cloudwatch]
}
