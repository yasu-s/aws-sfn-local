# aws-sfn-local

## Overview

- This is a sample of using [AWS Step Functions local](https://hub.docker.com/r/amazon/aws-stepfunctions-local) and [SAM CLI](https://aws.amazon.com/jp/serverless/sam/) to run Lambda locally.

## System Requirements

- Mac
- Docker - 20.10.7
- AWS CLI - 2.2.29
- SAM CLI - 1.27.2

## Usage

```bash
# Lambda execution with SAM CLI
sam local invoke HelloWorldFunction 

# Docker uo
docker compose up

# Lambda execution in Docker
aws lambda invoke --function-name HelloWorldFunction --endpoint http://127.0.0.1:3001/ output.txt

# Register StepFunctions in Docker
aws stepfunctions --endpoint http://localhost:8083 create-state-machine --name "HelloWorld" --role-arn "arn:aws:iam::012345678901:role/DummyRole" --definition file://./statemachine/sfn.asl.json

# Execute StepFunctions in Docker
aws stepfunctions --endpoint http://localhost:8083 start-execution --state-machine arn:aws:states:ap-northeast-1:123456789012:stateMachine:HelloWorld --name test
```

## Tips

### Configuration to invoke SAM CLI in Docker

- Invoking SAM CLI invoke in Docker results in `No response from invoke container` error.
- settings
  - Specify `/var/run/docker.sock:/var/run/docker.sock` as volumes.
  - Specify `--container-host host.docker.internal` as the startup option for SAM CLI.

### Why do you specify $PWD for working_dir?

- `Runtime.HandlerNotFound: index.handler is undefined or not exported` error when running Lambda in SAM CLI.
- As of SAM CLI version 1.27.2, when starting SAM CLI with Docker container, `-docker-volume-basedir` is not reflected correctly and Lambda fails to start.
- For the reasons mentioned above, the Docker container should have the same directory path as the host side so that SAM CLI can be launched.

## Reference URL

- https://github.com/aws/aws-sam-cli/issues/2837

