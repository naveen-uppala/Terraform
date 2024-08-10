terraform {
  backend "s3" {
    bucket         = "terraform-statefile-us-east-2-381492302819"  # The name of the S3 bucket
    key            = "statefile/terraform.tfstate"                 # The path to the state file within the bucket
    region         = "us-east-2"                 # The region where the S3 bucket is located
    dynamodb_table = "terraform-state-lock"      # The name of the DynamoDB table for locking
    encrypt        = true                        # Enable server-side encryption
  }
}
