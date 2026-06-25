
# module "vpc" {
#   source              = "../../terraform-aws-vpc"
#   project             = var.project
#   environment         = var.environment
#   is_peering_required = true
# }
module "sg" {
  count       = length(var.security_group_names)
  source      = "../../terraform-aws-sg"
  project     = var.project
  environment = var.environment
  sg_name     = replace(var.security_group_names[count.index], "_", "-")
  vpc_id      = local.vpc_id
  sg_tags     = var.sg_tags
}

#   sg_tags = var.sg_tags {
# }

