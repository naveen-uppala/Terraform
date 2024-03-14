provider "aws" {
  region = var.region
}

resource "aws_lb" "my_alb2" {
  name               = var.load_balancer_name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets
  enable_deletion_protection = var.enable_deletion_protection
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb2.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "OK"
      status_code  = "200"
    }
  }
}

resource "aws_lb_target_group" "my_target_group" {
  name        = var.target_group_name
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    path = var.health_check_path
  }
}

resource "aws_lb_listener_rule" "my_rule" {
  listener_arn = aws_lb_listener.my_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }

  condition {
    path_pattern {
      values = var.listener_rule_path_pattern
    }
  }
}
