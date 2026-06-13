locals {
  ami_id = data.aws_ami.joidevops.id
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
  database_subnet_ids       = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0] # public subnets are stored in stringList format to access required subnet we rae splitting them and accessing with 0'th element.                                                                                              
  mongodb_security_group_id = data.aws_ssm_parameter.mongodb_security_group_id.value
  redis_security_group_id = data.aws_ssm_parameter.redis_security_group_id.value
}