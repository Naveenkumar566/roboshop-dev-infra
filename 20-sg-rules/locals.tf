locals {
  bastion_security_group_id   = data.aws_ssm_parameter.bastion_security_group_id.value
  mongodb_security_group_id   = data.aws_ssm_parameter.mongodb_security_group_id.value
  catalogue_security_group_id = data.aws_ssm_parameter.catalogue_security_group_id.value
  user_security_group_id      = data.aws_ssm_parameter.user_security_group_id.value
}