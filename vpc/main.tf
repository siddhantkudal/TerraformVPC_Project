provider "aws" {
    region= "us-east-1"
}


#this block is used to create VPC
resource "aws_vpc" "main" {
  cidr_block = var.VPC_cidrblock
  tags = {
    Name = "vpc_project"
  }
}