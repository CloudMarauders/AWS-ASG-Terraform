resource "aws_lb" "CloudMaraduers-ASG-ALB" {
  name               = "CloudMaraduers-Load-Balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.CloudMaraduers-ASG-SG-TG02.id]
  subnets            = [aws_subnets.CloudMarauders-ASG-01.id, aws_subnets.CloudMarauders-ASG-02.id, aws_subnets.CloudMarauders-ASG-03.id]

  enable_deletion_protection = false

  tags = {
        name = "CloudMaraduers-ASG"
        Owner = "CloudMaraduers"
        ring = "prod"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.CloudMaraduers-ASG-ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.CloudMaraduers-ASG-TG-80.arn
  }
}

data "aws_acm_certificate" "cert" {
  domain   = "cloudmaraduers.com"
  statuses = ["ISSUED"]
  most_recent = true
  
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.CloudMaraduers-ASG-ALB.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = data.aws_acm_certificate.cert.arn
  certificate_arn   = data.aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.CloudMaraduers-ASG-TG-443.arn
  }
}

output "alb_dns_name" {
  value = aws_lb.CloudMaraduers-ASG-ALB.dns_name
  
}



