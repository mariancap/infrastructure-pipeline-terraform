resource "aws_route_table_association" "terraform_rt_associacion"{
        subnet_id = aws_subnet.public_subnet.id
        route_table_id = aws_route_table.terraform_route_table.id

}

