module "ec2_foreach" {
  source = "terraform-aws-modules/ec2-instance/aws"

  count = length(local.instances)

  name = "${local.instances[count.index]}-count"
  ami  = data.aws_ami.ubuntu.id

  instance_type = "t2.micro"
  key_name      = "${local.instances[count.index]}-count-user"
  monitoring    = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
