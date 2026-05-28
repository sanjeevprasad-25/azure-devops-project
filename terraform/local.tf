locals {
  santech_nsg = {
    "allow_ssh" = {
        destination_port_range = 22
        priority = 100
        description = "Allow SSH"
        }
     "allow_http" = {
        destination_port_range = 80
        priority = 110
        description = "Allow HTTP"
        }   
      "allow_https" = {
        destination_port_range = 443
        priority = 120
        description = "Allow HTTPS"
      }  
  }
}