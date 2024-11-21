provider "aws" {
    region= "us-east-1"
}

#created internet gateway so that instances inside subnet can accessinternet through internet gateway
#taking vpc id subnet id from root main.tf file 


resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = var.vpc_id
    tags = {
        Name= "vpc_project_internet_gateway"
    }

}


# create route table here we define rules like who can access the internet gatway 
#ex 0.0.0.0/0 everyone inside this vpc can access the inetnetgateway

resource "aws_route_table" "route_table" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }
    tags = {
        Name = "route_table_vpc_project"
    }

}

# created route table association to connect subnet 1 to route
resource "aws_route_table_association" "routetable_association_1" {
  subnet_id      = var.subnet1_id
  route_table_id = aws_route_table.route_table.id
}


# created route table association to connect subnet 2 to route

resource "aws_route_table_association" "routetable_association_2" {
  subnet_id      = var.subnet2_id
  route_table_id = aws_route_table.route_table.id
}
