module "vpc" {
  source              = "git::https://github.com/Naveenkumar566/terraform-aws-vpc.git?ref=main"
  project             = var.project
  environment         = var.environment
  is_peering_required = true
}
