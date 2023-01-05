
variable "cidrs_toset" {
    type = set(string)
    default = ["10.0.0.0/16", "172.16.0.0/16"]
  
}

resource "aws_vpc" "this_toset" {
    #for_each = toset(var.cidrs_toset)
    for_each = var.cidrs_toset
    cidr_block = each.value

  
}