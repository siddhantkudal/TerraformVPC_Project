output "vpc_status" {
    value= "VPC created "
}

output "vpc_id" {
    value=aws_vpc.main.id
}

output "vpc_cidrblock" {
    value=aws_vpc.main.cidr_block
}