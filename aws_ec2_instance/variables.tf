variable "ami-id" {
    description = "ubuntu machine image id "
}

variable "instanceType" {
    description = "type of instance we want create t2 micro here"
}

variable "security_group" {
    description = "security group id that we will attach to ec2 taking value from security group module"
}

variable "subnetid" {
    description = "subnet id that we will attach to ec2 taking value from subnet module"
}

