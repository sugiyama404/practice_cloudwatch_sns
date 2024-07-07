resource "aws_cloudwatch_log_metric_filter" "error_logs" {
  name           = "ErrorLogs"
  log_group_name = var.webserver_log_group_name
  pattern        = "{ $.level = \"error\" || $.level = \"fatal\" }"

  metric_transformation {
    name      = "ErrorCount"
    namespace = "YourNamespace"
    value     = "1"
  }
}
