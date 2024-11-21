provider "aws" {
  region = "us-east-1"
}

#basicalyy creating multi tier architecture 
#here we are passing value of cidr block to vpc module 
module "vpc" {
  source        = "./vpc"
  VPC_cidrblock = "10.0.0.0/16"
}


#this block contains the details of subnet here we are passing the value to the subnet module where creating subnet code is written

module "subnet" {
  source       = "./subnet"
  vpc_id       = module.vpc.vpc_id
  subnet1_cidr = "10.0.0.0/24"
  subnet2_cidr = "10.0.1.0/24"
  az1          = "us-east-1a"
  az2          = "us-east-1b"
}


#this block contains the details of both subnet 1 & 2 here we are passing the value internetgatway module 
module "internet_GW_Routetable" {
  source     = "./internet_GW_Routetable"
  vpc_id     = module.vpc.vpc_id
  subnet1_id = module.subnet.subnet_1_id
  subnet2_id = module.subnet.subnet_2_id

}


module "security_group" {
  source = "./security_group"
  vpc_id = module.vpc.vpc_id
  #cidr = module.vpc.vpc_cidrblock
  cidr = "0.0.0.0/0"
}


module "aws_ec2_instance" {
  source         = "./aws_ec2_instance"
  ami-id         = "ami-0866a3c8686eaeeba"
  instanceType   = "t2.micro"
  security_group = module.security_group.security_group
  subnetid       = module.subnet.subnet_1_id
}

module "loadbalancer" {
  source         = "./load_balancer"
  security_group = module.security_group.security_group
  subnet1_id     = module.subnet.subnet_1_id
  vpc_id         = module.vpc.vpc_id
  targetid       = module.aws_ec2_instance.instance_id
  subnet2_id     = module.subnet.subnet_2_id

}



