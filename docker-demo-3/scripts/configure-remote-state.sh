#!/bin/bash

echo "Newer terraform versions have a new way of defining a backend. Copy paste the following code in a backend.tf file, modify the region/s3 bucket, and execute 'terraform init' to initialize the backend. You'll be asked to copy the data from the local backend to the s3 backend, which you can answer yes.
"
echo 'backend.tf
==========
terraform {
  backend "s3" {
    bucket = "terraform-state-a3c731f"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}
'
set -ex
AWS_REGION="us-east-1"
S3_BUCKET=`aws s3 ls --region $AWS_REGION |grep terraform-state |tail -n1 |cut -d ' ' -f3`
sed -i 's/terraform-state-xx70dpnh/'${S3_BUCKET}'/' backend.tf
sed -i 's/#//g' backend.tf
terraform init
