# 
resource "aws_security_group_rule" "bastion_internet" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  # cidr_blocks       = [local.my_ip]
  # which SG you are creating this rule
  security_group_id = local.bastion_security_group_id
}

# MongoDB
resource "aws_security_group_rule" "mongodb_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_security_group_id
  security_group_id = local.mongodb_security_group_id
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.catalogue_security_group_id
  security_group_id = local.mongodb_security_group_id
}

resource "aws_security_group_rule" "mongodb_user" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.user_security_group_id
  security_group_id = local.mongodb_security_group_id
}



# Redis
resource "aws_security_group_rule" "redis_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_security_group_id
  security_group_id = local.redis_security_group_id
}

resource "aws_security_group_rule" "redis_user" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.user_security_group_id
  security_group_id = local.redis_security_group_id
}

resource "aws_security_group_rule" "redis_cart" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.cart_security_group_id
  security_group_id = local.redis_security_group_id
}



# MySQL
resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_security_group_id
  security_group_id = local.mysql_security_group_id
}

resource "aws_security_group_rule" "mysql_shipping" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.shipping_security_group_id
  security_group_id = local.mysql_security_group_id
}



# RabbitMQ
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_security_group_id
  security_group_id = local.rabbitmq_security_group_id
}

resource "aws_security_group_rule" "rabbitmq_payment" {
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.payment_security_group_id
  security_group_id = local.rabbitmq_security_group_id
}



# Catalogue
resource "aws_security_group_rule" "catalogue_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_security_group_id
  security_group_id = local.catalogue_security_group_id
}

resource "aws_security_group_rule" "catalogue_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.backend_alb_security_group_id
  security_group_id = local.catalogue_security_group_id
}



# User
resource "aws_security_group_rule" "user_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_security_group_id
  security_group_id = local.user_security_group_id
}

resource "aws_security_group_rule" "user_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.backend_alb_security_group_id
  security_group_id = local.user_security_group_id
}



#cart
resource "aws_security_group_rule" "cart_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_security_group_id
  security_group_id = local.cart_security_group_id
}

resource "aws_security_group_rule" "cart_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.backend_alb_security_group_id
  security_group_id = local.cart_security_group_id
}



#shipping
resource "aws_security_group_rule" "shipping_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_security_group_id
  security_group_id = local.shipping_security_group_id
}

resource "aws_security_group_rule" "shipping_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.backend_alb_security_group_id
  security_group_id = local.shipping_security_group_id
}



#payment
resource "aws_security_group_rule" "payment_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_security_group_id
  security_group_id = local.payment_security_group_id
}

resource "aws_security_group_rule" "payment_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.backend_alb_security_group_id
  security_group_id = local.payment_security_group_id
}


 
# Backend ALB
resource "aws_security_group_rule" "backend_alb_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_security_group_id
  security_group_id = local.backend_alb_security_group_id
}

resource "aws_security_group_rule" "backend_alb_catalogue" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.catalogue_security_group_id
  security_group_id = local.backend_alb_security_group_id
}

resource "aws_security_group_rule" "backend_alb_user" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.user_security_group_id
  security_group_id = local.backend_alb_security_group_id
}

resource "aws_security_group_rule" "backend_alb_cart" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.cart_security_group_id
  security_group_id = local.backend_alb_security_group_id
}

resource "aws_security_group_rule" "backend_alb_shipping" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.shipping_security_group_id
  security_group_id = local.backend_alb_security_group_id
}

resource "aws_security_group_rule" "backend_alb_payment" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.payment_security_group_id
  security_group_id = local.backend_alb_security_group_id
}

resource "aws_security_group_rule" "backend_alb_frontend" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.frontend_security_group_id
  security_group_id = local.backend_alb_security_group_id
}



#frontend
resource "aws_security_group_rule" "frontend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22 
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_security_group_id
  security_group_id = local.frontend_security_group_id
}

resource "aws_security_group_rule" "frontend_frontend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.frontend_alb_security_group_id
  security_group_id = local.frontend_security_group_id
}

#frontend ALB
resource "aws_security_group_rule" "frontend_alb_public" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  # cidr_blocks       = [local.my_ip]
  # which SG you are creating this rule
  security_group_id = local.frontend_alb_security_group_id
}

#openvpn
resource "aws_security_group_rule" "openvpn_public_443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  # cidr_blocks       = [local.my_ip]
  # which SG you are creating this rule
  security_group_id = local.openvpn_security_group_id
}

#Admin UI
resource "aws_security_group_rule" "openvpn_public_943" {
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  # cidr_blocks       = [local.my_ip]
  # which SG you are creating this rule
  security_group_id = local.openvpn_security_group_id
}

resource "aws_security_group_rule" "backend_alb_openvpn" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.openvpn_security_group_id
  security_group_id = local.backend_alb_security_group_id
}