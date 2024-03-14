provider "aws" {
  region = var.primary_region
}

#Create EC2 instance for testing purpose
resource "aws_instance" "myFirstInstance" {
  subnet_id = var.subnet_id
  ami     = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  vpc_security_group_ids= ["sg-00b6d2c08d20f65fb"]
  # user_data = "${file("installations.sh")}"
  tags= {
    Name = "tcn Instance"
  }
}  

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.myFirstInstance.id
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-2b"
  size              = 1
    tags = {
    Name = "HelloEBS"
  }
}
