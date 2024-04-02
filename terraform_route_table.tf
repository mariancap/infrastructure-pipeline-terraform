resource "aws_route_table" "terraform_route_table" {
        vpc_id = aws_vpc.vpc_licenta_marian.id

        route{
          cidr_block = "0.0.0.0/0"
          gateway_id = aws_internet_gateway.IG_terraform.id
}

        tags = {
          "Name" = "terraform-route-table"
}

}

