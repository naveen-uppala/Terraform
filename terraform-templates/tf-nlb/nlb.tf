provider "aws" {
  region = var.region
}

resource "aws_lb" "my_nlb" {
  name               = var.nlb_name
  internal           = var.internal_nlb
  load_balancer_type = "network"
  security_groups    = var.security_groups
  subnets            = var.subnets

  enable_deletion_protection = var.enable_deletion_protection
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_nlb.arn
  port              = var.listener_port
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

resource "aws_lb_target_group" "my_target_group" {
  name        = var.target_group_name
  port        = var.target_port
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    path = "/"
  }
}