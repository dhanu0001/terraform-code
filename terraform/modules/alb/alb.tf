resource "aws_security_group" "cx-backstage-alb-sg" {
  name        = "${var.project}-sg"
  description = "Allow traffic to application"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  ingress {
    description = "Allow HTTP traffic to application"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_alb" "default_alb" {
  name                       = "${var.project}-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.cx-backstage-alb-sg.id]
  subnets                    = var.subnet_ids
  enable_deletion_protection = false
}

resource "aws_alb_target_group" "cx-backstage-tg" {
  name        = "${var.project}-tg"
  port        = 7007
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
   healthy_threshold   = "2"
   interval            = "30"
   protocol            = "HTTP"
   matcher             = "200"
   timeout             = "5"
   path                = "/"
   unhealthy_threshold = "2"
  }
}

resource "aws_alb_listener" "default_listener" {
  #load_balancer_arn = aws_alb.default_alb.arn
  load_balancer_arn = aws_alb.default_alb.id
  protocol          = "HTTP"
  port              = 80

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cx-backstage-tg.id
  }
}