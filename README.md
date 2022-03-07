# Nacelle Devops Challenge v2
## Requirements
 1. Create a Lambda function that hits a public API to get BTC prices and writes the data to stdout.
 2. Create a CloudWatch Log Group and a CloudWatch Event Trigger to run every hour for the current price of Bitcoin.
 3. Create a Terraform to deploy all of the above resources.
 4. Create a CI/CD pipeline (using a CICD platform of your choice) that deploys the above Terraform.
 5. Create a README.md with any documentation you feel is necessary.

## Process
1. Resesarch Lambda function implementation as well as CloudWatch Log Insights
2. Find Endpoints to hit for Bitcoin prices  https://api.coindesk.com/v1/bpi/currentprice.json
3. Create a lambda function with python3
4. Create a CloudWatch Log Group and a CloudWatch Event Trigger to run  the Lambda Function every hour for the current price of Bitcoin.
5. Limit the data storage to the last 30 days
6. Create a GitHubAction to deploy the Terraform

