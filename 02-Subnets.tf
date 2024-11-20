resource "aws_subnet" "CloudMaraduers-ASG-01" {
  vpc_id                  = aws_vpc.CloudMaraduers-ASG.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-ASG-us-east-2a"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-ASG-02" {
  vpc_id                  = aws_vpc.CloudMaraduers-ASG.id
  cidr_block              = "172.16.2.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-ASG-us-east-2b"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-ASG-03" {
  vpc_id                  = aws_vpc.CloudMaraduers-ASG.id
  cidr_block              = "172.16.3.0/24"
  availability_zone       = "us-east-2c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-ASG-us-east-2c"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

################################################## Private Subnets
resource "aws_subnet" "CloudMaraduers-ASG-11" {
  vpc_id                  = aws_vpc.CloudMaraduers-ASG.id
  cidr_block              = "172.16.11.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-ASG-us-east-2a-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-ASG-12" {
  vpc_id                  = aws_vpc.CloudMaraduers-ASG.id
  cidr_block              = "172.16.12.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-ASG-us-east-2b-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-ASG-13" {
  vpc_id                  = aws_vpc.CloudMaraduers-ASG.id
  cidr_block              = "172.16.13.0/24"
  availability_zone       = "us-east-2c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-ASG-us-east-2c-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}