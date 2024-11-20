resource "aws_vpc" "CloudMaraduers-ASG" {
  cidr_block = "172.16.0.0/16"


  tags = {
    Name = "CloudMaraduers-ASG"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
}