source "amazon-ebs" "petclinic" {
  region           = var.aws_region
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-*-x86_64-gp2"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    most_recent = true
<<<<<<< HEAD
    owners      = ["137112412989"]
=======
    owners      = ["137112412989"]  
>>>>>>> 280f54677eb5cafbac52367984ecc15b5e725ec8
  }
  instance_type = "t2.micro"
  ssh_username  = "ec2-user"
<<<<<<< HEAD
  ami_name      = "petclinic-ami-${formatdate("YYYYMMDDhhmmss", timestamp())}"
=======
  ami_name      = "petclinic-ami"
>>>>>>> 280f54677eb5cafbac52367984ecc15b5e725ec8
}
