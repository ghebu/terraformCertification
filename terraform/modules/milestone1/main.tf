locals {
  inbound_ports  = [80, 22]
}


##Creating a vpc
resource "aws_vpc" "milestone" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MilestoneVPC"
  }
}

##Creating 1x public subnet and 2x private subnets
resource "aws_subnet" "milestone" {
  for_each                = var.subnets_map
  vpc_id                  = aws_vpc.milestone.id
  cidr_block              = "10.0.${each.key}.0/24"
  map_public_ip_on_launch = each.value.1

  tags = {
    Name = "Milestone-${each.value.0}"
  }
}

##Creating the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.milestone.id

  tags = {
    Name = "milestone-igw"
  }
}

##Creating the NAT GW and elastic IP
resource "aws_eip" "nat" {}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.milestone.1.id
}


##Creating the route table for the public subnet
resource "aws_route_table" "public_subnet" {
  vpc_id = aws_vpc.milestone.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "Milestone-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.milestone.1.id
  route_table_id = aws_route_table.public_subnet.id
}




####Creating the route table for the private subnet
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.milestone.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }


  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "Milestone-private-rt"
  }
}

resource "aws_route_table_association" "private" {
  for_each       = toset(["2", "3"])
  subnet_id      = aws_subnet.milestone[each.value].id
  route_table_id = aws_route_table.private.id
}


##Creating an instance in the public subnet
resource "aws_network_interface" "bastion" {
  subnet_id = aws_subnet.milestone.1.id

  tags = {
    Name = "primary_network_interface"
  }
}


resource "aws_instance" "bastion" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.milestone.1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.bastion.id]

  user_data = base64encode(<<EOF
#!/bin/bash 
set -x
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
export INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" 169.254.169.254/latest/meta-data/instance-id)

sudo yum update -y 
sudo yum install httpd -y 
echo The instance $INSTANCE_ID welcomes you at Terraform Certification path |& sudo tee  -a /var/www/html/index.html

sudo systemctl enable --now httpd 
EOF
  )


  tags = {
    Name = "Bastion"
  }

}


resource "aws_security_group" "bastion" {
  name        = "bastion host sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.milestone.id

  dynamic "ingress" {
    for_each = local.inbound_ports
    content { 
        description = "TLS from VPC"
        from_port   = ingress.value
        to_port     = ingress.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



