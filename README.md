# TerraformVPC_Project
This project demonstrates the use of Terraform for provisioning AWS resources. It includes creating a VPC, subnets, an internet gateway, an EC2 instance, a load balancer, and deploying a status website. The website is accessible via the DNS of the load balancer. The Terraform state file is securely stored in an S3 bucket.



# Terraform Deployment of a Status Website

## Overview
This project showcases the use of Terraform to deploy infrastructure and applications on AWS. A status website is hosted on an EC2 instance and served via an application load balancer.

## Features
- Custom VPC with subnets and an internet gateway.
- Application load balancer routing to an EC2 instance.
- Terraform state managed in an S3 bucket.

## Getting Started
1. Clone this repository: `git clone https://github.com/your-username/terraform-project.git`
2. Initialize Terraform: `terraform init`
3. Plan and apply the configuration: `terraform apply`
4. Access the website using the load balancer's DNS.

## Requirements
- Terraform v1.0+
- AWS CLI configured with appropriate permissions.

## Directory Structure
Refer to the directory structure in the project.

## Notes
- Ensure the S3 bucket for state storage exists prior to running Terraform.
- AWS credentials are not stored in this repository. Use secure methods to manage them.


