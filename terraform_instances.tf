resource "aws_instance" "marian_instance1"{
        ami= "ami-0c101f26f147fa7fd"
        instance_type = "t2.micro"
        subnet_id = aws_subnet.public_subnet.id
        vpc_security_group_ids = [aws_security_group.sg_terraform.id]
        key_name = "DevOpsKey_Licenta"

        tags = {
          "Name" = "marian_instance1"
}

}



resource "aws_instance" "marian_instance2"{
        ami= "ami-0c101f26f147fa7fd"
        instance_type = "t2.micro"
        subnet_id = aws_subnet.public_subnet.id
        vpc_security_group_ids = [aws_security_group.sg_terraform.id]
        key_name = "DevOpsKey_Licenta"

        tags = {
          "Name" = "marian_instance2"
}

}

resource "aws_instance" "marian_instance3"{
        ami= "ami-0c101f26f147fa7fd"
        instance_type = "t2.micro"
        subnet_id = aws_subnet.public_subnet.id
        vpc_security_group_ids = [aws_security_group.sg_terraform.id]
        key_name = "DevOpsKey_Licenta"

        tags = {
          "Name" = "marian_instance3"
}

}
