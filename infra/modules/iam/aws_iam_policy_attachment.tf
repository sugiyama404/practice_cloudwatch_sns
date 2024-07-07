resource "aws_iam_policy_attachment" "lambda_role_attachment" {
  name       = "${var.app_name}-lambda-attach"
  roles      = ["${aws_iam_role.lambda_role.name}"]
  policy_arn = aws_iam_policy.lambda_policy.arn
}
