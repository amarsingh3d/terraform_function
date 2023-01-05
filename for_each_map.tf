variable "cidrs_map" {
    type = map(string)
    default = {
        Prod = "10.0.0.0/16"
        Dev= "172.16.0.0/16"
        }
  
}

resource "aws_vpc" "this_map" {
    for_each = var.cidrs_map
    cidr_block = each.value
    tags = {
        Name = each.key
    }
  
}