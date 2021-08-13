# aws-sfn-local

## 概要

- [AWS Step Functions local](https://hub.docker.com/r/amazon/aws-stepfunctions-local)と[SAM CLI](https://aws.amazon.com/jp/serverless/sam/)を使用してLambdaをローカル実行するサンプルです。

## 動作環境

- Mac
- Docker
- AWS CLI
- SAM CLI

## 動作確認

```bash
# SAM CLIでLambda実行
sam local invoke HelloWorldFunction 

# Docker起動
docker-compose up

# Docker内のLambda実行
aws lambda invoke --function-name HelloWorldFunction --endpoint http://127.0.0.1:3001/ output.txt

```
