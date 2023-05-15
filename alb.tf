# APPLICATION LOAD BALANCER
resource "aws_lb" "terraform-alb" {
    for_each           = toset(local.public_subnets)
   
    name               = "terraform-alb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.ssh_public_sg.id]
  

  enable_deletion_protection = true
    
}


