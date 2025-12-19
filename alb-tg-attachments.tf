resource "aws_lb_target_group_attachment" "app" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = aws_instance.example.id
  port             = 80
}
