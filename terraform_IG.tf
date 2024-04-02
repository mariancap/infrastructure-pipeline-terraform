resource "aws_internet_gateway" "IG_terraform"{
        vpc_id = aws_vpc.vpc_licenta_marian.id
        tags = {
         "Name" = "IG_terraform"
}


}

