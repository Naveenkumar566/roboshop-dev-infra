#loadbalancer
resource "aws_lb" "frontend_alb" {
  name               = "${var.project}-${var.environment}-frontend"                      #roboboshop-dev
  internal           = false                                                    
  load_balancer_type = "application"
  security_groups    = [local.frontend_alb_security_group_id]
  subnets            = local.public_subnet_ids

  enable_deletion_protection = false                                           #keeping this as false makes it delete while practing the terraform

  tags = merge(
    {
      Name = "${var.project}-${var.environment}-frontend-alb"
    },
    local.common_tags
  )
}


#listner
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  certificate_arn = local.frontend_alb_certificate_arn
  
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "<h1> Hi, I am HTTP frontend ALB </h1>"
      status_code  = "200"
    }
  }
}


#route53record
resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "*.${var.domain_name}"
  type    = "A"

  #load balancers 
  alias {
    name                   = aws_lb.frontend_alb.dns_name
    zone_id                = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
  }
  allow_overwrite = true
}
