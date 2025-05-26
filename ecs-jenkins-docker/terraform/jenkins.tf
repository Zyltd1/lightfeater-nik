resource "aws_instance" "jenkins_ecs" {
  ami                         = data.aws_ami.amazon_linux2.id
  instance_type               = "t3.micro"
  key_name                    = var.key_pair
  subnet_id                   = aws_subnet.public[0].id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ecs_service.id]

  tags = {
    Name = "jenkins-on-docker"
  }
}

data "aws_ami" "amazon_linux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
