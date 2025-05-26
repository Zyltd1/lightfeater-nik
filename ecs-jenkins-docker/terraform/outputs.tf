output "jenkins_public_ip" {
  value = aws_instance.jenkins_ecs.public_ip
}
