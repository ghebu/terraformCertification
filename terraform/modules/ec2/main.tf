##first option



resource "aws_instance" "web" {
  for_each      = toset(["name1", "name2", "name3"])
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t3.micro"

  tags = {
    Name = each.key
  }

}

