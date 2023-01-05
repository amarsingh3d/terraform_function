variable "user_name" {
    type = list(string)
    default = ["user1", "user2", "user3"]

      
}


resource "aws_iam_user" "this" {
    count = length(var.user_name)
    name = var.user_name[count.index]
  
}


variable "u_name" {
    type = map(string)
    default = {
      "prod_user" = "prod_smtp"
      "dev_user" = "dev_smtp"
    }

}

resource "aws_iam_user" "user_name_map" {
    for_each = var.u_name
    name = each.value

    tags = {
      "Name" = each.key
    }
  
}