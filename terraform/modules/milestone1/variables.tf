variable "subnets_map" {
  default = {
    "1" : {"subnet": "public-subnet", "public_ip": "true"}
    "2" : { "subnet": "private-subnet-1", "public_ip": "false"}
    "3" : { "subnet": "private-subnet-2", "public_ip": "false" }
  }
}


variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "ami" { 
  default = "ami-0005e0cfe09cc9050"
}