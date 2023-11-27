#!/bin/bash

# use the IMDSv2 method to retrieve the instance ID of the EC2 instance
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` 

# get the instance region
region=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/placement/availability-zone | head -c-1)

# eet the instance availability zone
availability_zone=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/placement/availability-zone)

# get the instance private IP address
private_ip=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/local-ipv4)

# get the instance public IP address
public_ip=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/public-ipv4)

# get the instance name
instance_name=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/public-hostname)

# get the instance ID
instance_id=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id)

# get the instance account number
instance_acc_nr=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/network/interfaces/macs/02:a2:1f:d5:fe:0f/owner-id)


# Write the global variables to a file
echo "region: $region" > /opt/output.txt
echo "availability_zone: $availability_zone" >> /opt/output.txt
echo "private_ip: $private_ip" >> /opt/output.txt
echo "public_ip: $public_ip" >> /opt/output.txt
echo "instance_name: $instance_name" >> /opt/output.txt
echo "instance_id: $instance_id" >> /opt/output.txt
echo "instance_acc_nr: $instance_acc_nr" >> /opt/output.txt
