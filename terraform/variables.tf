variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "Your AWS Key Pair name"
  type        = string
  default     = "projectkey"
  

}

variable "ami_id" {
  default = "ami-0ed094fb1304fd857"  # Amazon Linux 2 us-east-1
}

variable "instance_type" {
  default = "t3.small"  # needs RAM for ML model
}