
variable "instance_type" {
  type        = string
  description = "The instance type to use for the EC2 instance"
}

variable "ami" {
  type        = string
  description = "The AMI to use for the EC2 instance"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the EC2 instance"
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  tags          = var.tags
}

output "public_ip" {
  value       = aws_instance.ec2_instance.public_ip
  description = "The public IP of the EC2 instance"
}