variable "vpc_id" {
    description = "this contains the vpc id coming from module in root main.tf file and value is assigned to subnet main.tf"
}

variable "subnet1_cidr" {
    description = "This contains cidr value for subnet 1 we are passing this value from root main.tf file "
}


variable "subnet2_cidr" {
    description = "This contains cidr value for subnet 2 we are passing this value from root main.tf file "
}

variable "az1" {
    description = "this contains availability zone where we creating subnet 1 we are passing this value from root main.tf"
}

variable "az2" {
    description = "this contains availability zone where we creating subnet 2 we are passing this value from root main.tf"
}