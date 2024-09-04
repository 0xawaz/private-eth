resource "aws_eks_node_group" "apps" {
  cluster_name    = var.cluster_name
  node_group_name = var.ng_name
  node_role_arn   = aws_iam_role.nodes.arn

  subnet_ids      =  module.vpc.private_subnets

  capacity_type   = var.capacity_type
  instance_types  = var.instance_type

  scaling_config {
    desired_size = var.ng_desired_capacity
    max_size     = var.ng_max_capacity
    min_size     = var.ng_min_capacity
  }

  update_config {
    max_unavailable = var.ng_max_unavailable
  }

  labels = {
    role      = "general"
    node_pool = var.k8s_label
  }

  depends_on = [
    module.eks,
    aws_iam_role_policy_attachment.nodes_amazon_eks_worker_node_policy,
    aws_iam_role_policy_attachment.nodes_amazon_eks_cni_policy,
    aws_iam_role_policy_attachment.nodes_amazon_ec2_container_registry_read_only,
  ]
}