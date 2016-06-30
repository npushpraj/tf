variable "zones"{
  default = "a"
} 
variable "region" {
    default = "us-east-1"
}
variable "amis" {
    default = "ami-a4827dc9"
}
variable "key_name" {
    default = "aws-key-east"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "security_group_name" {
    default = "basic-access"
}
variable "vpc_id" {
    default = "vpc-2acadb4e"
}
variable "subnet_id" {
    default = "subnet-c0b032ea"
}
