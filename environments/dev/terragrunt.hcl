terraform {
  source = "../../modules/ec2.tf"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  instance_type = "t2.micro"
  ami           = "ami-0c55b24aca56cf24a" # Example AMI for us-east-1, change as needed
  tags = {
    Name = "dev-ec2"
  }
}