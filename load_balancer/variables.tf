variable "security_group" {
    description = "assigning security group to load balancer"
    
}

variable "subnet1_id" {
    description = "here we are taking the subnet 1 id from root main.tf file "
}

variable "subnet2_id" {
    description = "here we are taking the subnet 2 id from root main.tf file "
}

variable "vpc_id" {
    description = "vpc id for creating security group"
}



variable "targetid" {
    description = "vpc id for creating security group"
}
