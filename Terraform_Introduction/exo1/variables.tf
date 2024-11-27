variable "aws_region" {
  type = string
  description = "region of our infra"
  default = "us-west-2"
}

variable "instance_type" {
  description = "type of our instance"
  type = string
  default = "t2.medium"
}