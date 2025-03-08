# You can customize these values as needed
region = "us-east-2"
internal = false
load_balancer_name = "frontend-alb"
subnets = ["subnet-0ebf7061d92cb1854", "subnet-01a4eb19143e0a787", "subnet-0222086e138ca3852"]
enable_deletion_protection = false
listener_port = 443
listener_protocol = "HTTPS"
vpc_id = "vpc-08f32cb147bf6df43"
listener_rule_path_pattern = ["/"]
