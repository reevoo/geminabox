resource "aws_route53_record" "geminabox" {
  zone_id = "${data.aws_route53_zone.reevoocloud.zone_id}"
  name    = "geminabox-production-efs.${data.aws_route53_zone.reevoocloud.name}"
  type    = "CNAME"
  ttl     = "300"

  records = ["${aws_efs_file_system.geminabox.dns_name}"]
}

