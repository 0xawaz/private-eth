# Project configuration
tf_admin_credentials = "~/.aws/credentials"
region               = "us-east-1"
env                  = "staging"

vpc_name             = "0xawaz-peth"
vpc_cidr             = "10.0.0.0/16"
private_subnets      = ["10.0.0.0/19", "10.0.32.0/19"]
public_subnets       = ["10.0.64.0/19", "10.0.96.0/19"]
  
# EKS cluster
cluster_name = "0xawaz-private-eth-eks"

# Node Group
instance_type       = ["t2.medium"]
capacity_type       = "ON_DEMAND"

ng_name             = "eth"
ng_desired_capacity = 1
ng_min_capacity     = 1
ng_max_capacity     = 5
ng_max_unavailable  = 1

# IMPORTANT: this will be used in the node affinity/selector
k8s_label  = "apps"

# ECR
ecr_repository = "0xawaz/private-eth"
