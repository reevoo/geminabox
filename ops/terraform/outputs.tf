output "efs-sg-id" {
  value = "${aws_security_group.efs-sg.id}"
}

output "efs-dns-name" {
  value = "${aws_route53_record.geminabox.fqdn}"
}



