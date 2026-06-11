
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