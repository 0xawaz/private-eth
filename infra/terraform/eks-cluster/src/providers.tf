provider "aws" {
  region                   = var.region
  # Note that shared_credentials_file was replaced in v4 by shared_credentials_files and file() is not longer needed 
  shared_credentials_files = [var.tf_admin_credentials]
  profile                  = "default"
}
