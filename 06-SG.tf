resource "aws_security_group" "CloudMaraduers-ASG-SG-TG01" {
  vpc_id = aws_vpc.CloudMaraduers-ASG.id
    description = "HTTP, HTTPS "
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        name = "CloudMaraduers-ASG"
        Owner = "CloudMaraduers"
        ring = "prod"
    }
}


#############################################Load Balancer

resource "aws_security_group" "CloudMaraduers-ASG-SG-TG02" {
  vpc_id = aws_vpc.CloudMaraduers-ASG.id
    description = "HTTP, HTTPS "
  
  ingress {
    description = "HTTP, Homepage"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS, Secure"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        name = "CloudMaraduers-ASG"
        Owner = "CloudMaraduers"
        ring = "prod"
    }
}