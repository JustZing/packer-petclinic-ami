output "ami_id" {
  value = build.amazon-ebs.petclinic.id
}

output "region" {
  value = var.aws_region
}

