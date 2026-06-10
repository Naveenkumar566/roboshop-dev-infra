locals {
  ami_id = data.aws_ami.joidevops.id
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
  public_subnet_ids         = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0] #Public subnets are stored in stringList format, to access required subnet we rae splitting them and accessing with 0'th element. 
  bastion_security_group_id = data.aws_ssm_parameter.bastion_security_group_id.value
}
