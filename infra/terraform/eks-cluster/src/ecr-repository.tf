resource "aws_ecr_repository" "_0xawaz" {
  name                 = var.ecr_repository
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  # lifecycle {
  #   prevent_destroy = true
  # }

}