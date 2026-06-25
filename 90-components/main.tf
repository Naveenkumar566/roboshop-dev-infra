module "component" {
  for_each = var.component
  source = "git::https://github.com/Naveenkumar566/terraform-roboshop-component.git?ref=main"
  component = each.key
  role_priority = each.value.rule_priority
}  