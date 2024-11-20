resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.CloudMaraduers-ASG.id

    tags = {
        Name  = "CloudMaraduers-ASG"
        Owner = "CloudMaraduers"
        ring  = "prod"
    }
  
}