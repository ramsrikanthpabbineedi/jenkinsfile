provider "aws" {
  region = var.aws_region
}
resource "aws_sns_topic" "sns" {
  tags = {
    Name = var.sns_name
  }
}
resource "aws_sns_topic_subscription" "subscr" {
  topic_arn = aws_sns_topic.sns.arn
  protocol  = "email"
  endpoint  = "gsai07383@gmail.com"

}
resource "aws_cloudwatch_metric_alarm" "foobar" {
  alarm_name                = "terraform-test-foobar5"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 70
  alarm_description         = "This metric monitors ec2 cpu utilization"
  actions_enabled           = "true"
  ok_actions                = [aws_sns_topic.sns.arn]
  alarm_actions             = [aws_sns_topic.sns.arn]
  insufficient_data_actions = [aws_sns_topic.sns.arn]
  dimensions = {
    instanceId = "i-0e5c2e6a95b52e21e"
  }
}
