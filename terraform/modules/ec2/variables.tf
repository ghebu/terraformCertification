variable "instance_names" {
  default     = ["name1", "name2", "name3"]
  type        = list(any)
  description = "Var containing EC2 instance names"
}
