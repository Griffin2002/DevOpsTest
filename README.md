# Devops Challenge v2
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

## Notes
1. There is currently no VPC information/access key for terraform to use to deploy the resources. (this is intentional, in order to prevent resources from being deployed to my private aws account as part of the exercise)
2. My familiarity with Lambda functions and CloudWatch Log Insights is limited. Normally, I would be reaching out to another senior engineer to help me with this; however, that is out of scope for this exercise.
3. I chose Python to generate the Lambda function because it is the most popular language for Lambda functions. And it is simple to implement.
4. I chose to use that specific endpoint for the Lambda function because it is the most popular endpoint for Bitcoin prices. And was the first one I found.
5. I would not expect this code to be found in production, since it has not been peer reviewed.
6. I also expect there to be errors in the code, due to my inexperience with Lambda functions and CloudWatch Log Insights.
7. Total time spent on this exercise: 6-8 hours (research, implementation, documentation, etc.)
