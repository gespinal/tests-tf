module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(local.instances)

  name = each.key
  ami  = data.aws_ami.ubuntu.id

  instance_type = "t2.micro"
  key_name      = "${each.key}-user"
  monitoring    = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}