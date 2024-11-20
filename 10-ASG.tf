resource "aws_autoscaling_group" "CloudMaraduers-ASG80" {
  name                      = "CloudMaraduers-auto-scaling-group"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  target_group_arns         = [aws_lb.CloudMaraduers-ASG-TG-80.arn]
  vpc_zone_identifier       = [aws_subnet.CloudMaraduers-ASG-11.id, aws_subnet.CloudMaraduers-ASG-12.id, aws_subnet.CloudMaraduers-ASG-13.id]

  launch_template {
    id      = aws_launch_template.CloudMarauders-LT-80.id
    version = "$Latest"
}

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances",
  ]

initial_lifecycle_hook {
    name                 = "instance-protection-launch"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 60
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
    notification_metadata = "{\"key\":\"value\"}"
    }

initial_lifecycle_hook {
    name                 = "scale-in-protection"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 300
    lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"
    }

tag {
    key                 = "Name"
    value               = "CloudMarauders-ASG80"
    propagate_at_launch = true
  }

tag {
    key                 = "Environment"
    value               = "prod"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "asg88" {
  name                      = "CloudMarauders-cpu-target"
  scaling_adjustment        = 4
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 120
  autoscaling_group_name    = aws_autoscaling_group.CloudMaraduers-ASG80.name

  target_tracking_configuration {
        predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 75.0
    }

}
resource "aws_autoscaling_attachment" "CloudMarauders-ASG80-attachment" {
  autoscaling_group_name = aws_autoscaling_group.CloudMaraduers-ASG80.name
  lb_target_group_arn   = aws_lb_target_group.CloudMaraduers-ASG-TG-80.arn

}


###########################################################443

resource "aws_autoscaling_group" "CloudMaraduers-ASG443" {
  name                      = "CloudMaraduers-auto-scaling-group-443"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  target_group_arns         = [aws_lb.CloudMaraduers-ASG-TG-443.arn]
  vpc_zone_identifier       = [aws_subnet.CloudMaraduers-ASG-11.id, aws_subnet.CloudMaraduers-ASG-12.id, aws_subnet.CloudMaraduers-ASG-13.id]

  launch_template {
    id      = aws_launch_template.CloudMarauders-LT-443.id
    version = "$Latest"
}

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances",
  ]

initial_lifecycle_hook {
    name                 = "instance-protection-launch"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 60
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
    notification_metadata = "{\"key\":\"value\"}"
    }

initial_lifecycle_hook {
    name                 = "scale-in-proctection"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 300
    lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"
    }

tag {
    key                 = "Name"
    value               = "CloudMarauders-ASG443"
    propagate_at_launch = true
  }

tag {
    key                 = "Environment"
    value               = "prod"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "asg443" {
  name                      = "CloudMarauders-cpu-target"
  scaling_adjustment        = 4
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 120
  autoscaling_group_name    = aws_autoscaling_group.CloudMaraduers-ASG443.name

  target_tracking_configuration {
        predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 75.0
    }

}
resource "aws_autoscaling_attachment" "CloudMarauders-ASG443-attachment" {
  autoscaling_group_name = aws_autoscaling_group.CloudMaraduers-ASG443.name
  lb_target_group_arn   = aws_lb_target_group.CloudMaraduers-ASG-TG-443.arn

}


