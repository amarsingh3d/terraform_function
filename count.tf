resource "aws_instance" "this_count" {
    ami = "this_ami"
    instance_type = "t2.small"
    count = 2
    tags = {
      "Name" = "WEB-W${count.index}"
    }
  
}

output "pubIP" {
    value = aws_instance.this_count[*].public_ip
  
}

output "PIP" {
    value = [for ec2 in aws_instance.this_count :  ec2.public_ip]
  
}