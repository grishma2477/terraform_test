resource "aws_instance" "nginxserver" {
    ami = "ami-00e801948462f718a"
    instance_type = "t2.small"
    subnet_id = aws_subnet.public_subnet.id 

    vpc_security_group_ids = [ aws_security_group.nginx-sg.id ]
    associate_public_ip_address = true 

    user_data = <<-EOF
                #!/bin/bash
                sudo apt install nginx -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                EOF
    tags = {
        Name = "NginxServer"
    }
}