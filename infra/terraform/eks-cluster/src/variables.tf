## ---------------------
## Project configuration
## ---------------------

variable "tf_admin_credentials" {
  description = "AWS provider service account key to be used as terraform admin"
}
variable "region" {
  description = "Region in which to manage AWS resources"
}

variable "env" {
  
}

## ---------------------
## Network configuration
## ---------------------
variable "vpc_name" {
  
}

variable "vpc_cidr" {
  type        = string
}

variable "private_subnets" {
  
}

variable "public_subnets" {
  
}

## -----------------
## EKS configuration
## -----------------
variable "cluster_name" {
  
}

variable "ng_name" {
  
}

variable "instance_type" {
  
}

variable "capacity_type" {
  
}

variable "ng_desired_capacity" {
  
}

variable "ng_min_capacity" {
  
}

variable "ng_max_capacity" {
  
}

variable "ng_max_unavailable" {
  
}


variable "k8s_label" {
  
}

## -----------------
## ECR configuration
## -----------------
variable "ecr_repository" {
  
}
