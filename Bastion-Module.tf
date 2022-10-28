#Module for Single Ec2 Instance/Bastion Host
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "${local.name}-Bastion-Host"

  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.ec2_instance_type
  key_name      = var.instance_key_pair
  #monitoring             = False
  subnet_id              = module.vpc-terraform.public_subnets[0]
  vpc_security_group_ids = [module.web_server_sg.security_group_id]

  tags = local.common_tags
}