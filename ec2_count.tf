module "ec2_count" {
  source = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(local.instances)

  name = "${each.key}-each"
  ami  = data.aws_ami.ubuntu.id

  instance_type = "t2.micro"
  key_name      = "${each.key}-each-user"
  monitoring    = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
