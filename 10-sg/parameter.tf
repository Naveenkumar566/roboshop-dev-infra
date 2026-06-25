
resource "aws_ssm_parameter" "security_group_id" {
  count = length(var.security_group_names)
  name  = "/${var.project}/${var.environment}/${var.security_group_names[count.index]}_security_group_id" #/roboshop/dev/bastion[11]security_group_id
  type  = "String"
  value = module.sg[count.index].security_group_id
}
