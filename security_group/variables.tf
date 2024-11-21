variable "vpc_id" {
    description = "vpc id for creating security group"
}

variable "cidr" {
    description = "Cidr value passing from root main.tf file to security group inbound rule so they can access"
}