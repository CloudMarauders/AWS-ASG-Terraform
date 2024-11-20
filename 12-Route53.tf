data "aws_route53_zone" "main" {
  name = "cloudmaraduers.com"
  private_zone = false
  
}


resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "cloudmaraduers.com"
  type    = "A"

  alias {
    name                   = aws_lb.CloudMaraduers-ASG-ALB.dns_name
    zone_id                = aws_lb.CloudMaraduers-ASG-ALB.zone_id
    evaluate_target_health = true
    }


}