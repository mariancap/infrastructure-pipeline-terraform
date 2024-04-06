variable "ami" {
  type        = string
  description = "AMI for Ubuntu"
  default     = "ami-080e1f13689e07408"
}

variable "available_zones_us" {
  type        = string
  description = "Availability Zones"
  default     = "us-east-1a"

}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "name_tag" {
  type        = string
  description = "Instance name"
  default     = "My EC2 Instance"
}

variable "vpc_name" {
  type        = string
  description = "Instance VPC name"
  default     = "Marian-us-east-1-vpc-licenta"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR values"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public subnet CIDR values"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "Private subnet CIDR values"
  default     = "10.0.2.0/24"
}

