# IMPORTANT: Create a bucket in S3 first if not exist
# Note that: you cannot use variable interpolation in a backend configuration

terraform {
  backend "s3" {
    bucket                  = "0xawaz-tfstate"
    workspace_key_prefix    = "k8s-cluster"
    key                     = "terraform.tfstate"
    region                  = "us-east-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "default"
  }
}

