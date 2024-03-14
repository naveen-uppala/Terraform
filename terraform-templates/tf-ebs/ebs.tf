provider "aws" {
  region  = var.aws_region
  # profile = var.aws_profile
}

resource "aws_ebs_volume" "tncebs" {
  availability_zone = var.ebs_availability_zone
  size              = var.ebs_size
  type              = var.ebs_type
  encrypted         = var.ebs_encrypted

  tags = {
    Name        = var.ebs_name
    Environment = var.ebs_environment
  }
}

resource "aws_volume_attachment" "mountvolumetoec2" {
  device_name = var.device_name
  instance_id = var.instance_id
  volume_id = "${aws_ebs_volume.tncebs.id}"
}
