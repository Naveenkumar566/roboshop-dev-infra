#loadbalancer
resource "aws_lb" "backend-alb" {
  name               = "${var.project}-${var.environment}"                      #roboboshop-dev
  internal           = true                                                     #this private alb so keeping it as false makes not available for public
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_security_group_id]
  subnets            = local.private_subnet_ids

  enable_deletion_protection = false                                           #keeping this as false makes it delete while practing the terraform

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.id
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = merge(
    {
      Name = "${var.project}-${var.environment}-backend-alb"
    },
    local.common_tags
  )
}


#listner
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.backend-alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "<h1> Hi, I am HTTP backend ALB </h1>"
      status_code  = "200"
    }
  }
}


#route53record
resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.environment}.${var.domain_name}"
  type    = "A"

  #load balancers 
  alias {
    name                   = aws_lb.backend-alb.dns_name
    zone_id                = aws_lb.backend-alb.zone_id
    evaluate_target_health = true
  }
}
