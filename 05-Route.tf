resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-ASG.id

  route {
    cidr_block                  = "0.0.0.0/0"
    nat_gateway_id              = aws_nat_gateway.nat.id
    carrier_gateway_id          = ""
    destination_prefix_list_id  = ""
    egress_only_gateway_id      = ""
    gateway_id                  = ""
    ipv6_cidr_block             = ""
    local_gateway_id            = ""
    network_interface_id        = ""
    transit_gateway_id          = ""
    vpc_endpoint_id             = ""
    vpc_peering_connection_id   = ""
    instance_id                 = ""
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-ASG-Private-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-ASG.id

  route {
    cidr_block                  = "0.0.0.0/0"
    nat_gateway_id              = ""
    carrier_gateway_id          = ""
    destination_prefix_list_id  = ""
    egress_only_gateway_id      = ""
    gateway_id                  = aws_internet_gateway.igw.id
    ipv6_cidr_block             = ""
    local_gateway_id            = ""
    network_interface_id        = ""
    transit_gateway_id          = ""
    vpc_endpoint_id             = ""
    vpc_peering_connection_id   = ""
    instance_id                 = ""
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-ASG-Public-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}

################################################## Private Subnets
resource "aws_route_table_association" "private-us-east-2a" {
  subnet_id      = aws_subnet.CloudMaraduers-ASG-11.id
  route_table_id = aws_route_table.private_route_table.id
  
}

resource "aws_route_table_association" "private-us-east-2b" {
  subnet_id      = aws_subnet.CloudMaraduers-ASG-12.id
  route_table_id = aws_route_table.private_route_table.id
  
}

resource "aws_route_table_association" "private-us-east-2c" {
  subnet_id      = aws_subnet.CloudMaraduers-ASG-13.id
  route_table_id = aws_route_table.private_route_table.id
  
}

################################################## Public Subnets

resource "aws_route_table_association" "public-us-east-2a" {
  subnet_id      = aws_subnet.CloudMaraduers-ASG-01.id
  route_table_id = aws_route_table.public_route_table.id
  
}

resource "aws_route_table_association" "public-us-east-2b" {
  subnet_id      = aws_subnet.CloudMaraduers-ASG-02.id
  route_table_id = aws_route_table.public_route_table.id
  
}

resource "aws_route_table_association" "public-us-east-2c" {
  subnet_id      = aws_subnet.CloudMaraduers-ASG-03.id
  route_table_id = aws_route_table.public_route_table.id
  
}