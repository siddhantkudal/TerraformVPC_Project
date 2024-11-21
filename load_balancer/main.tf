provider "aws" {
  region= "us-east-1"
}


#It is use to create load balancer
resource "aws_lb" "myalb" {
  name = "Applicationloadbalancer"
  internal = false
  load_balancer_type = "application"

  security_groups = [var.security_group]
  subnets = [ var.subnet1_id, var.subnet2_id ]
  tags = {
    Name="APL"
  }
}

#this block is used to create target group
resource "aws_lb_target_group" "tg" {
    name = "mytg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
}

#this block is used to attach instance to target group
resource "aws_lb_target_group_attachment" "attach1" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = var.targetid
    port = 80

}

resource "aws_lb_listener" "listner" {
    load_balancer_arn = aws_lb.myalb.arn
    port = 80
    protocol = "HTTP"
    default_action {
      target_group_arn = aws_lb_target_group.tg.arn
      type = "forward"
    }
}