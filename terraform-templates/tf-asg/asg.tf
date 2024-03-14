provider "aws" {
  region = var.aws_region
}

resource "aws_launch_template" "mysvc" {
  name                                 = "tcn-lt"
  ebs_optimized                        = true
  image_id                             = var.ami_id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.instance_type
  key_name                             = var.key_name
  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = var.subnet_id
    security_groups             = var.security_groups
    delete_on_termination       = true
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name          = "mysvc"
    }
  }
}

resource "aws_autoscaling_group" "mysvc" {
  name                      = "tcn-${aws_launch_template.mysvc.latest_version}"
  health_check_type         = "EC2"  # Changed health check type to EC2
  health_check_grace_period = 120
  termination_policies      = ["OldestInstance"]
  launch_template {
    id      = aws_launch_template.mysvc.id
    version = aws_launch_template.mysvc.latest_version
  }
  min_size = var.min_size
  max_size = var.max_size
  desired_capacity = var.default_desired_capacity

  tag {
    key                 = "mysvc-template-version"
    value               = aws_launch_template.mysvc.latest_version
    propagate_at_launch = false
  }

#   lifecycle {
#     create_before_destroy = true
#   }
#   target_group_arns = [aws_lb_target_group.svc.arn]
}
