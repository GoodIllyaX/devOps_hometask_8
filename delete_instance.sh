#!/bin/bash

if [ -z "$1" ]; then
  echo "DELETE - specify the instance ID"
  echo "instruction: ./delete_instance.sh <instance-id>"
  exit 1
fi

INSTANCE_ID=$1

echo "Deleting instance by ID: $INSTANCE_ID"
aws ec2 terminate-instances --instance-ids "$INSTANCE_ID"