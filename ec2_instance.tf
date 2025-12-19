resource "aws_instance" "example" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"

  subnet_id              = aws_subnet.priv-sub.id
  vpc_security_group_ids = [aws_security_group.allow_http.id]

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Karim Elhosiny</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "EC2-myInstance"
  }
}
