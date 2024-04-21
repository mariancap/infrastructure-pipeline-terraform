resource "aws_vpc" "vpc_marian_licenta" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }

}

resource "aws_subnet" "public_subnet" {

  vpc_id                  = aws_vpc.vpc_marian_licenta.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.available_zones_us
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_marian"
  }

}




resource "aws_subnet" "private_subnet" {

  vpc_id                  = aws_vpc.vpc_marian_licenta.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.available_zones_us
  map_public_ip_on_launch = true

  tags = {
    Name = "private_subnet_marian"
  }

}





resource "aws_security_group" "terra_script_sg" {

  vpc_id = aws_vpc.vpc_marian_licenta.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


 ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name        = "terra_script_sg"
    Description = "terra_script_sg"
  }

}


resource "aws_internet_gateway" "ig_custom" {
  vpc_id = aws_vpc.vpc_marian_licenta.id

  tags = {
    Name = "ig_custom"
  }

}



resource "aws_route_table" "rt_custom_internet" {

  vpc_id = aws_vpc.vpc_marian_licenta.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_custom.id

  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.ig_custom.id
  }


  tags = {
    Name = "rt_custom_internet"
  }

}

resource "aws_route_table_association" "rt_association_marian" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt_custom_internet.id
}

resource "aws_key_pair" "TF_key"{
	key_name = "TF_key"
	public_key = tls_private_key.rsa.public_key_openssh

}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}
	



resource "aws_instance" "my_vm" {
  ami           = var.ami //Linux AMI
  instance_type = var.instance_type
  key_name      = "TF_key"

  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.terra_script_sg.id]
  associate_public_ip_address = true

  connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file(local_file.TF_key.filename)
        host = self.public_ip
}
  
  tags = {
    Name = var.name_tag
  }
}

