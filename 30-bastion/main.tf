
resource "aws_instance" "bastion" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  subnet_id              = local.public_subnet_ids
  vpc_security_group_ids = [local.bastion_security_group_id]
  iam_instance_profile   = aws_iam_instance_profile.bastion.name
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
    tags = merge(
    {
      Name = "${var.project}-${var.environment}-bastion"                              #this tags are for EBS volume
    },
    local.common_tags
  )
}

  tags = merge(
    {
      Name = "${var.project}-${var.environment}-bastion"
    },
    local.common_tags
  )
}

resource "aws_iam_role" "bastion_role" {
  name = "RoboshopDevBastion"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"                                              #this points that this role is for EC2 instance
        }
      },
    ]
  })

  tags = merge(
    {
      Name = "RoboshopDevBastion"
    },
    local.common_tags
  )
}

resource "aws_iam_role_policy_attachment" "bastion" {
  role       = aws_iam_role.bastion_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"                               #fetch it from AWS console "Administaractor Acess"
}

resource "aws_iam_instance_profile" "bastion" {
  name = "${var.project}-${var.environment}-bastion"
  role = aws_iam_role.bastion_role.name
}
  #check

