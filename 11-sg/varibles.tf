
variable "project" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "sg_tags" {
  type = map(string)

  default = {
    Name = "sg-dev"
  }
}

variable "security_group_names" { #These are sg names not rules, we have not added sg rules here because if in case there are any changes to rules we can change them seperately.
  type = list(string)
  default = [

    #Databases
    "mongodb", "redis", "mysql", "rabbitmq",

    #Backend
    "catalogue", "user", "cart", "shipping", "payment",

    #Bakend ALB
    "backend_alb",

    #forntend
    "frontend",

    #Frontend_ALB
    "frontend_alb",

    #Bastion
    "bastion",

    #openvpn
    "openvpn"
  ]
}