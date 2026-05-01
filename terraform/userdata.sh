#!/bin/bash
yum update -y
yum install -y docker
service docker start
usermod -aG docker ec2-user

docker pull affanalrayyan/ml-inference-api:latest
docker run -d -p 8000:8000 affanalrayyan/ml-inference-api:latest