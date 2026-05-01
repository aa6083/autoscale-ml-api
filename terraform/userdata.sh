#!/bin/bash
yum update -y
yum install -y docker
service docker start
usermod -aG docker ec2-user

# Pull and run the Docker image from DockerHub
docker pull YOUR_DOCKERHUB_USERNAME/ml-inference-api:latest
docker run -d -p 8000:8000 YOUR_DOCKERHUB_USERNAME/ml-inference-api:latest 