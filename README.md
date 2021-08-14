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

# Docker内のStepFunctions登録
aws stepfunctions --endpoint http://localhost:8083 create-state-machine --name "HelloWorld" --role-arn "arn:aws:iam::012345678901:role/DummyRole" --definition file://./statemachine/sfn.asl.json

# Docker内のStepFunctions実行
aws stepfunctions --endpoint http://localhost:8083 start-execution --state-machine arn:aws:states:ap-northeast-1:123456789012:stateMachine:HelloWorld --name test
```

## Tips

### working_dirに$PWDを指定している理由

- SAM CLIのバージョンが1.27.2時点、DockerコンテナでSAM CLIを起動すると`-docker-volume-basedir`が正しく反映されずLambdaの起動に失敗する。
- 上記の理由からDockerコンテナもホスト側と同様のディレクトリパスにすることでSAM CLIが起動できるようにした。
