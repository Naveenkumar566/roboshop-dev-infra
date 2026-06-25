locals {
  backend_alb_security_group_id = data.aws_ssm_parameter.backend_alb_security_group_id.value
  private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
}