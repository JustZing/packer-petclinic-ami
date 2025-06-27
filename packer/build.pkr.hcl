build {
  name    = "petclinic-docker-ami"
  sources = ["source.amazon-ebs.petclinic"]

  provisioner "shell" {
    inline = [
      # Wait for any other yum processes to finish to avoid lock issues
      "while sudo fuser /var/run/yum.pid >/dev/null 2>&1; do echo 'Waiting for yum lock...'; sleep 5; done",
      "sudo yum update -y",
      "sudo yum install -y docker containerd git screen",
      "wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)",
      "sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/libexec/docker/cli-plugins/docker-compose",
      "sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose",
      "sudo systemctl enable docker.service --now",
      "sudo usermod -aG docker ssm-user || true",
      "sudo usermod -aG docker ec2-user || true",
      "sudo systemctl restart docker.service",
      "docker pull karthik0741/images:petclinic_img"
    ]
  }
}
