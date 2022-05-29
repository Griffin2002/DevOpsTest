resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

}


resource "aws_lambda_function" "bitcoin_lambda" {
  filename         = var.lambda_file_name
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_role.arn
  runtime          = "python3.9"
  handler          = "main.lambda_handler"
  source_code_hash = filebase64sha256(var.lambda_file_name)
  depends_on       = [aws_iam_role.lambda_role]
}

resource "aws_cloudwatch_log_group" "bitcoin_log_group" {
  name              = "bitcoin_log_group"
  retention_in_days = 30
}


module "lambda-cloudwatch-events-trigger" {
  source                     = "infrablocks/lambda-cloudwatch-events-trigger/aws"
  depends_on                 = [aws_iam_role.lambda_role, aws_lambda_function.bitcoin_lambda, aws_cloudwatch_log_group.bitcoin_log_group, aws_cloudwatch_event_rule.bitcoin_event_rule]
  version                    = "1.1.0-rc.1"
  component                  = var.lambda_function_name
  deployment_identifier      = "production"
  lambda_arn                 = aws_iam_role.lambda_role.arn
  lambda_function_name       = aws_lambda_function.bitcoin_lambda.function_name
  region                     = "us-east-1"
  lambda_schedule_expression = "rate(1 hour)"
}