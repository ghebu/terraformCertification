variable "ami" {
  default     = "ami-0005e0cfe09cc9050"
  type        = string
  description = "The AMI Id to be used for the creation of EC2 instance"
}


variable "instance_type" {
  default = "t3.micro"
}
