output default_security_group_id {
  value = aws_security_group.cx-backstage-alb-sg.id
}

output target_group_arn {
  value = aws_alb_target_group.cx-backstage-tg.arn
}

output alb_dns_name {
  value = aws_alb.default_alb.dns_name
}