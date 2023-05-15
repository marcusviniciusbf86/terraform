# APPLICATION LOAD BALANCER
resource "aws_alb" "terraform-alb" {
  for_each      = toset(local.public_subnets)
  
  subnets         = ["subnet-081adb6debae12b12", "subnet-07c4be8b609494830", "subnet-05256ff14c6a76f99"]
  name            = "terraform-alb"
  security_groups = [aws_security_group.ssh_public_sg.id]
    
}

# TARGET GROUP
resource "aws_alb_target_group" "group" {
  name     = "terraform-alb-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.this.id
  stickiness {
    type = "lb_cookie"
  }
# Alter the destination of the health check to be the login page.
  health_check {
    path = "/login"
    port = 80
  }
}

# LISTENER PORT 80 HTTP

