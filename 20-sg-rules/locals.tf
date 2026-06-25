locals {
  bastion_security_group_id        = data.aws_ssm_parameter.bastion_security_group_id.value
  mongodb_security_group_id        = data.aws_ssm_parameter.mongodb_security_group_id.value
  catalogue_security_group_id      = data.aws_ssm_parameter.catalogue_security_group_id.value
  user_security_group_id           = data.aws_ssm_parameter.user_security_group_id.value
  mysql_security_group_id          = data.aws_ssm_parameter.mysql_security_group_id.value
  redis_security_group_id          = data.aws_ssm_parameter.redis_security_group_id.value
  rabbitmq_security_group_id       = data.aws_ssm_parameter.rabbitmq_security_group_id.value
  backend_alb_security_group_id    = data.aws_ssm_parameter.backend_alb_security_group_id.value
  frontend_alb_security_group_id   = data.aws_ssm_parameter.frontend_alb_security_group_id.value
  cart_security_group_id           = data.aws_ssm_parameter.cart_security_group_id.value
  shipping_security_group_id       = data.aws_ssm_parameter.shipping_security_group_id.value
  payment_security_group_id        = data.aws_ssm_parameter.payment_security_group_id.value
  frontend_security_group_id       = data.aws_ssm_parameter.frontend_security_group_id.value
  openvpn_security_group_id        = data.aws_ssm_parameter.openvpn_security_group_id.value
}