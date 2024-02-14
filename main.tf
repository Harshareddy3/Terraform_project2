provider "aws" {
region = "us-east-1"
#access_key = "f96c4dd2590c4a6c93361db7326d901d"
#secret_key = "jaZNKM2MEKg/EiwogOhKsA4iWUUCIFPLUUtX5asj"
}

resource "aws_instance" "one" {
ami = "ami-0e731c8a588258d0d"
instance_type = "t2.medium"
   key_name = "Terraform"
   vpc_security_group_ids = [aws_security_group.sg.id]
   availability_zone = "us-east-1a"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd 
sudo chkconfig httpd on
sudo echo "Hi All This is My Netflix-1 Web-Application Created by Terraform Infrastructute By Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "Netflix-1"
}
}

resource "aws_instance" "two" {
ami = "ami-0e731c8a588258d0d"
instance_type = "t2.medium"
   key_name = "Terraform"
   vpc_security_group_ids = [aws_security_group.sg.id]
   availability_zone = "us-east-1b"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo chkconfig httpd on
sudo echo "Hi All This is My Netflix-2 Web-Application Created by Terraform Infrastructute By Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "Netflix-2"
}
}
