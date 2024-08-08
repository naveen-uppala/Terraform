variable "region" {
  description = "Region where you want to provision the infra"
  type        = string
  default     = "us-east-2"
}

variable "sg_name" {
  description = "Name of the Security Group"
  type        = list(string)
}
