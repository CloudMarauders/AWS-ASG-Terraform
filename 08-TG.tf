resource "aws_lb_target_group" "CloudMaraduers-ASG-TG-80" {
  name     = "CloudMaraduers-ASG-TG01-80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.CloudMaraduers-ASG.id
  target_type = "instance"

    health_check {
        enabled = true
        path                = "/"
        protocol            = "HTTP"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
        matcher             = "200"
    }

    tags = {
        name = "CloudMaraduers-ASG"
        Owner = "CloudMaraduers"
        ring = "prod"
    }



}

################################################# 443

resource "aws_lb_target_group" "CloudMaraduers-ASG-TG-443" {
  name     = "CloudMaraduers-ASG-TG02-443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.CloudMaraduers-ASG.id
  target_type = "instance"

    health_check {
        enabled = true
        path                = "/"
        protocol            = "HTTP"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
        matcher             = "200"
    }

    tags = {
        name = "CloudMaraduers-ASG"
        Owner = "CloudMaraduers"
        ring = "prod"
    }



}









