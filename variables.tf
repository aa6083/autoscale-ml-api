variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "Your AWS Key Pair name"
  type        = string
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316"  # Amazon Linux 2 us-east-1
}

variable "instance_type" {
  default = "t2.medium"  # needs RAM for ML model
}