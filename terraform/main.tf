provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "ml_sg" {
  name        = "ml-api-sg"
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ml_api" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ml_sg.id]
  user_data              = file("terraform/userdata.sh")

  tags = {
    Name = "AutoScale-ML-API"
  }
}