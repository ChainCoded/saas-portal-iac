# modules/alb/main.tf

resource "aws_lb" "this" {
  name               = "${var.name_prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name        = "${var.name_prefix}-alb"
    Environment = split("-", var.name_prefix)[length(split("-", var.name_prefix)) - 1]
  }
}

resource "aws_lb_target_group" "this" {
  name        = "${substr(var.name_prefix, 0, 17)}-tg-${var.app_port}"
  port        = var.app_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.name_prefix}-tg"
  }
}

resource "aws_lb_target_group_attachment" "app" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.app_instance_id
  port             = var.app_port
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  depends_on = [
    aws_lb_target_group.this,
    aws_lb_target_group_attachment.app
  ]
}