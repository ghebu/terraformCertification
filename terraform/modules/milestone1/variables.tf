variable "subnets_map" {
  default = {
    "1" : ["public-subnet", "true"]
    "2" : ["private-subnet-1", "false"]
    "3" : ["private-subnet-2", "false"]
  }
}


