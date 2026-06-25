locals {
  ami_id =  data.aws_ami.openvpn.id
  openvpn_security_group_id = data.aws_ssm_parameter.openvpn_security_group_id.value
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_id.value)[0]
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
}