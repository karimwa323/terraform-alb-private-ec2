resource "aws_lb" "app_alb" {
  name               = "app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]

  subnets = [
    aws_subnet.pub_sub1.id,
    aws_subnet.pub_sub2.id
  ]

  tags = {
    Name = "app-alb"
  }
}
