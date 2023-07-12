module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  count = length(local.instances)

  name = local.instances[count.index]
  ami  = data.aws_ami.ubuntu.id

  instance_type = "t2.micro"
  key_name      = "${local.instances[count.index]}-user"
  monitoring    = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
