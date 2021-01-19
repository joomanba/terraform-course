#!/bin/bash
REGION="us-east-1"
ECR_REPO="351276329499.dkr.ecr.us-east-1.amazonaws.com/my-service"
aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${ECR_REPO}