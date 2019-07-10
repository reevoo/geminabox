resource "aws_efs_file_system" "geminabox" {
  encrypted        = false
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  tags = "${merge(local.common_tags, map(
        "Name", "geminabox"
    ))}"
}

resource "aws_efs_mount_target" "private-1a" {
  file_system_id = "${aws_efs_file_system.geminabox.id}"
  subnet_id      = "${data.aws_subnet.main-private-1a.id}"

  security_groups = [
    "${aws_security_group.efs-sg.id}",
  ]
}

resource "aws_efs_mount_target" "private-1b" {
  file_system_id = "${aws_efs_file_system.geminabox.id}"
  subnet_id      = "${data.aws_subnet.main-private-1b.id}"

  security_groups = [
    "${aws_security_group.efs-sg.id}",
  ]
}

resource "aws_efs_mount_target" "private-1c" {
  file_system_id = "${aws_efs_file_system.geminabox.id}"
  subnet_id      = "${data.aws_subnet.main-private-1c.id}"

  security_groups = [
    "${aws_security_group.efs-sg.id}",
  ]
}


