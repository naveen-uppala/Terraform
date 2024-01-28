provider "aws" {
    region = "ap-south-1"
  
}

module "s3_module" {
    source = "C:/Users/uppal/Desktop/naveen/Terraform/aws-devops/tf-k8/controlplane.tf"
  
}