variable "instance_names" {
  default     = ["name1", "name2", "name3"]
  type        = list(any)
  description = "Var containing EC2 instance names"
}

variable "instance_type" {
  default     = "t3.micro"
  type        = string
  description = "EC2 instance type"
}

variable "ami" {
  default     = "ami-0005e0cfe09cc9050"
  type        = string
  description = "The AMI Id to be used for the creation of EC2 instance"
}
