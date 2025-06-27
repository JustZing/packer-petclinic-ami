source "amazon-ebs" "petclinic" {
  region           = var.aws_region

  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-*-x86_64-gp2"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    most_recent = true
    owners      = ["137112412989"]
  }

  instance_type = "t2.micro"
  ssh_username  = "ec2-user"
  ami_name      = "petclinic-ami-${formatdate("YYYYMMDDhhmmss", timestamp())}"
}
