#!/usr/bin/env python3

from ec2_metadata import ec2_metadata
import os

region = ec2_metadata.region
az_code = ec2_metadata.availability_zone
publicip = ec2_metadata.public_ipv4
privateip = ec2_metadata.private_ipv4
instance_name = ec2_metadata.public_hostname
instance_id = ec2_metadata.instance_id
account_number = ec2_metadata.account_id

# Create a file to store the output
with open("output.txt", "w") as f:
    f.write(f"Region name: {region}\n")
    f.write(f"AZ name: {az_code}\n")
    f.write(f"Public IP address: {publicip}\n")
    f.write(f"Private IP address: {privateip}\n")
    f.write(f"Name of instance: {instance_name}\n")
    f.write(f"Instance ID: {instance_id}\n")
    f.write(f"Account number: {account_number}\n")

# Print a message to indicate that the file has been created
print("Instance data has been saved to output.txt")
