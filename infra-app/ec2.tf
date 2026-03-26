# Key Pair (Login)
resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-infra-app-key"      # Changed hyphen to underscore
  public_key = file("my-terraform-key.pub") # Requires a path to your public key file
  tags = {
      Environment = var.env
   }
}

# VPC & Security Group
resource "aws_default_vpc" "default" {
}

resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app-sg"
  description = "Sample Security Group for EC2 Instance"
  vpc_id      = aws_default_vpc.default.id

  # You must define rules, or the SG will block all incoming traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be careful: this opens SSH to the world
  }
   
   ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
   tags = {
      Environment = var.env
   }
}

# EC2 Instance
resource "aws_instance" "my-ec2-instance" {
   count = var.instance_count
   key_name = aws_key_pair.my_key.key_name
   security_groups = [aws_security_group.my_security_group.name]
   instance_type = var.instance_type
   ami = var.ami_id
   root_block_device {
     volume_size = var.env == "prd" ? 20 : 10
     volume_type = "gp3"
   }
   tags = {
      Name = "${var.env}-Infra-EC2"
      Environment = var.env
   }
}
