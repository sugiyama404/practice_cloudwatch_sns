import boto3
import os
import json

sns_client = boto3.client('sns')
# ここでSNSトピックARNを取得します
sns_topic_arn = os.environ['SNS_TOPIC_ARN']


def lambda_handler(event, context):
    # CloudWatch Logsのイベントからメッセージを抽出します
    for record in event['Records']:
        # CloudWatch LogsのデータはBase64でエンコードされています
        log_data = json.loads(record['body'])
        log_message = log_data['message']

        # メールの内容を作成します
        message = f"Error log detected:\n{log_message}"
        subject = "CloudWatch Error Log Alert"

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
