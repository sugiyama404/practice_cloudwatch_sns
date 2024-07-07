import boto3
import os
import json

sns_client = boto3.client('sns')
# ここでSNSトピックARNを取得します
sns_topic_arn = os.environ['SNS_TOPIC_ARN']


def lambda_handler(event, context):
    # メールの内容を作成します
    message = "This is a test message from SNS triggered Lambda function."
    subject = "Test Email"

    # SNSトピックにメッセージをパブリッシュします
    sns_client.publish(
        TopicArn=sns_topic_arn,
        Message=message,
        Subject=subject
    )

    return {
        'statusCode': 200,
        'body': json.dumps('Email sent successfully!')
    }
