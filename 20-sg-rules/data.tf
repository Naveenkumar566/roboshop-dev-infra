data "aws_ssm_parameter" "bastion_security_group_id" {                      #
  name = "/${var.project}/${var.environment}/bastion_security_group_id"
}

data "aws_ssm_parameter" "mongodb_security_group_id" {                       #
  name = "/${var.project}/${var.environment}/mongodb_security_group_id"
}

data "aws_ssm_parameter" "catalogue_security_group_id" {                     #
  name = "/${var.project}/${var.environment}/catalogue_security_group_id"
}

data "aws_ssm_parameter" "user_security_group_id" {                          #
  name = "/${var.project}/${var.environment}/user_security_group_id"
}

data "aws_ssm_parameter" "redis_security_group_id" {                          #
  name = "/${var.project}/${var.environment}/redis_security_group_id"
}

data "aws_ssm_parameter" "mysql_security_group_id" {                          #
  name = "/${var.project}/${var.environment}/mysql_security_group_id"
}

data "aws_ssm_parameter" "rabbitmq_security_group_id" {                       #
  name = "/${var.project}/${var.environment}/rabbitmq_security_group_id"
}

data "aws_ssm_parameter" "backend_alb_security_group_id" {                    #
  name = "/${var.project}/${var.environment}/backend_alb_security_group_id"
}

data "aws_ssm_parameter" "frontend_alb_security_group_id" {                    #
  name = "/${var.project}/${var.environment}/frontend_alb_security_group_id"
}

data "aws_ssm_parameter" "cart_security_group_id" {                            #
  name = "/${var.project}/${var.environment}/cart_security_group_id"
}

data "aws_ssm_parameter" "shipping_security_group_id" {                        #
  name = "/${var.project}/${var.environment}/shipping_security_group_id"
}

data "aws_ssm_parameter" "payment_security_group_id" {                          #
  name = "/${var.project}/${var.environment}/payment_security_group_id"
}

data "aws_ssm_parameter" "frontend_security_group_id" {                          #
  name = "/${var.project}/${var.environment}/frontend_security_group_id"
}

data "aws_ssm_parameter" "openvpn_security_group_id" {                          #
  name = "/${var.project}/${var.environment}/openvpn_security_group_id"
}