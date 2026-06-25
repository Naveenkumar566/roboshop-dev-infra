locals {
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  ami_id = data.aws_ami.joidevops.id
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
  private_subnet_ids       = split(",", data.aws_ssm_parameter.private_subnet_ids.value) #[0]                # public subnets are stored in stringList format to access required subnet we rae splitting them and accessing with 0'th element.                                                                                              
  catalogue_security_group_id = data.aws_ssm_parameter.catalogue_security_group_id.value
  backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value
}  
