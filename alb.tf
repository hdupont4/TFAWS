resource "aws_security_group" "alb_sg" {
  name        = "alb-security-group"
  vpc_id      = module.core-compute.vpc_id 
  description = "Allow HTTP and HTTPS traffic to ALB"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "application" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.core-compute.public_subnet_ids 

  tags = {
    Name = var.alb_name
  }
}

resource "aws_lb_target_group" "eks" {
  name        = "eks-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.core-compute.vpc_id 
  target_type = "instance"
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.application.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.eks.arn
  }
}

