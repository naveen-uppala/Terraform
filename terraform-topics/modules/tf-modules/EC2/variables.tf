variable "ami_id" {
  type = string
  description = "AMI ID for creating the instance"
} 

variable "instance_type" {
  type = string
  description = "instance cpu and memory configuration"
}

variable "security_groups" {
  type = list(string)
  
}
