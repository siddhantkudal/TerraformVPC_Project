provider "aws" {
  region= "us-east-1"
}

resource "aws_key_pair" "keypair" {
  key_name   = "web-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "EC1" {
    ami = var.ami-id
    instance_type = var.instanceType
    key_name = aws_key_pair.keypair.key_name
    vpc_security_group_ids = [var.security_group]
    subnet_id = var.subnetid
    #user_data = base64encode(file("E:/DEVOPS/terraform/Terraform_Project/aws_ec2_instance/website1.sh"))


    tags = {
    Name = "web-Instance1" 
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"  # Replace with the appropriate username for your EC2 instance
    private_key = file("~/.ssh/id_rsa")  # Replace with the path to your private key
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "E:/DEVOPS/terraform/Terraform_Project/aws_ec2_instance/website1.sh"
    destination = "/home/ubuntu/website1.sh"
  }

#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /home/ubuntu/website1.sh",  # Make script executable
#       "sudo /home/ubuntu/website1.sh"       # Run the script
#     ]
#    }

}



# resource "aws_instance" "EC2" {
#     ami = var.ami-id
#     instance_type = var.instanceType
#     vpc_security_group_ids = [var.security_group]
#     subnet_id = var.subnetid
#     user_data = base64encode(file("E:/DEVOPS/terraform/Terraform_Project/aws_ec2_instance/website1.sh"))

#     tags = {
#     Name = "web-Instance2" 
#   }
# }


