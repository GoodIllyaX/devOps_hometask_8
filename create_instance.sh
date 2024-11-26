#!/bin/bash

KEY_NAME=${1:-default_key}                  
SECURITY_GROUP_ID=${2:-default_sg_id}       
SUBNET_ID=${3:-default_subnet_id}           
IAM_PROFILE_NAME=${4:-default_iam_profile}  


aws ec2 run-instances \
    --image-id ami-053b0d53c279acc90 \
    --count 1 \
    --instance-type t2.micro \
    --key-name $KEY_NAME  \
    --security-group-ids $SECURITY_GROUP_ID \
    --subnet-id $SUBNET_ID \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=Lab4}]" \
    --iam-instance-profile Name="$IAM_PROFILE_NAME" \
    --user-data file://./userdata.sh \