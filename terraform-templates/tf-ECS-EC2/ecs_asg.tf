# --- ECS ASG ---

resource "aws_autoscaling_group" "ecs" {
  name_prefix               = "demo-ecs-asg-"
  vpc_zone_identifier       = var.aws_subnet.*
  min_size                  = 2
  max_size                  = 4
  health_check_grace_period = 0
  health_check_type         = "EC2"
  protect_from_scale_in     = false

  launch_template {
    id      = aws_launch_template.ecs_ec2.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "demo-ecs-cluster"
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = ""
    propagate_at_launch = true
  }
}