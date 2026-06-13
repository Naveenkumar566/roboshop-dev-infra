
variable "project" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "sg_tags" {
  type    = map(string)
  default = {}
}

variable "zone_id" {
  default = "Z0219290BLQSTVKG2BJS"
}

variable "domain_name" {
  default = "naveenkanna.online"
}