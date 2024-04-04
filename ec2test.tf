resource "aws_instance" "myec2test" {
  ami           = "ami-0c101f26f147fa7fd"  
  instance_type = "t2.micro"
  tags = {
    "Name" : "JenkinsInstance2"
  }
}
