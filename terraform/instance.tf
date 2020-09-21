resource "aws_instance" "Jenkins" {
  ami           = var.AMIS
  instance_type = "t2.medium"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-web.id]

  # the public SSH key
  key_name   = aws_key_pair.mykey.key_name
  private_ip = "172.22.101.101"
  provisioner "file" {
    source      = "script/base.sh"
    destination = "/tmp/base.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/base.sh",
      "sudo /tmp/base.sh"
    ]
  }

  provisioner "file" {
    source      = "script/installJenkins.sh"
    destination = "/tmp/installJenkins.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installJenkins.sh",
      "sudo /tmp/installJenkins.sh"
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
  tags = {
    Name = "Jenkins1"
  }
}


resource "aws_instance" "jm1" {
  ami           = var.AMIS
  instance_type = "t2.small"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-web.id]

  # the public SSH key
  key_name   = aws_key_pair.mykey.key_name
  private_ip = "172.22.101.111"
  provisioner "file" {
    source      = "script/base.sh"
    destination = "/tmp/base.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/base.sh",
      "sudo /tmp/base.sh"
    ]
  }

  provisioner "file" {
    source      = "script/install_tomcat.sh"
    destination = "/tmp/install_tomcat.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install_tomcat.sh",
      "sudo /tmp/install_tomcat.sh"
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
  tags = {
    Name = "jm1"
  }
}

resource "aws_instance" "jm2" {
  ami           = var.AMIS
  instance_type = "t2.small"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-artifactory.id]

  # the public SSH key
  key_name   = aws_key_pair.mykey.key_name
  private_ip = "172.22.101.121"
  provisioner "file" {
    source      = "script/base.sh"
    destination = "/tmp/base.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/base.sh",
      "sudo /tmp/base.sh"
    ]
  }
  provisioner "file" {
    source      = "script/artifactory.sh"
    destination = "/tmp/artifactory.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/artifactory.sh",
      "sudo /tmp/artifactory.sh"
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
  tags = {
    Name = "jm2"
  }
}
