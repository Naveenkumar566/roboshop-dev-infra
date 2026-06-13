resource "aws_instance" "mongodb" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  subnet_id              = local.database_subnet_ids
  vpc_security_group_ids = [local.mongodb_security_group_id]

  tags = merge(
    {
      Name = "${var.project}-${var.environment}-mongodb"
    },
    local.common_tags
  )
}


resource "terraform_data" "bootstrap" {
  triggers_replace = [
    aws_instance.mongodb.id
  ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh"      # Local file path
    destination = "/tmp/bootstrap.sh" #destination path on the remotemachine
  }


  provisioner "remote-exec" {
<<<<<<< HEAD
    inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh mongodb"
     ]
=======
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh"
    ]
>>>>>>> 4c4c246 (actions)
  }
}

     