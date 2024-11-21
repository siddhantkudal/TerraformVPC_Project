provider "aws" {
    region= "us-east-1"
}

#this block is use to create subnet 1 we are taking value from root main.tf file 
resource "aws_subnet" "subnet1" {
    vpc_id     = var.vpc_id
    cidr_block = var.subnet1_cidr
    availability_zone       = var.az1
    map_public_ip_on_launch = true

    tags = {
        Name = "vpc_project_subnet1"
    }
}

#this block is use to create subnet 2 we are taking value from root main.tf file
resource "aws_subnet" "subnet2" {
    vpc_id     = var.vpc_id
    cidr_block = var.subnet2_cidr
    availability_zone       = var.az2
    map_public_ip_on_launch = true

    tags = {
        Name = "vpc_project_subnet2"
    }
}
