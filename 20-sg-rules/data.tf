data "aws_ssm_parameter" "bastion_security_group_id" {
  name = "/${var.project}/${var.environment}/bastion_security_group_id"
}

data "aws_ssm_parameter" "mongodb_security_group_id" {
  name = "/${var.project}/${var.environment}/mongodb_security_group_id"
}

data "aws_ssm_parameter" "catalogue_security_group_id" {
  name = "/${var.project}/${var.environment}/catalogue_security_group_id"
}

data "aws_ssm_parameter" "user_security_group_id" {
  name = "/${var.project}/${var.environment}/user_security_group_id"
}