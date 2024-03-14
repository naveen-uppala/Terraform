# You can customize these values as needed
region = "us-east-2"
internal = false
load_balancer_name = "my-alb2"
security_groups = ["sg-06ac155edea432fbc"]
subnets = ["subnet-061b0dd145e444875", "subnet-0c821a62cb75f25be", "subnet-03113ab7dc2eae892"]
enable_deletion_protection = false
listener_port = 80
listener_protocol = "HTTP"
target_group_name = "my-target-group"
target_group_port = 80
target_group_protocol = "HTTP"
vpc_id = "vpc-0b46d8b7746118a42"
health_check_path = "/"
listener_rule_path_pattern = ["/"]
