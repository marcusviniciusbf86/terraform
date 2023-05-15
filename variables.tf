variable "vpc_configuration" {
  type = object({
    cidr_block = string
    subnets = list(object({
      name       = string
      cidr_block = string
      public     = bool
    }))
  })
  default = {
    cidr_block = "10.0.0.0/16"
    subnets = [
      {
        name       = "private-a"
        cidr_block = "10.0.0.32/27"
        public     = false
      },
      {
        name       = "private-b"
        cidr_block = "10.0.4.0/22"
        public     = false
      },
      {
        name       = "private-c"
        cidr_block = "10.0.8.0/22"
        public     = false
      },
      {
        name       = "public-a"
        cidr_block = "10.0.12.0/22"
        public     = true
      },
      {
        name       = "public-b"
        cidr_block = "10.0.16.0/22"
        public     = true
      },
      {
        name       = "public-c"
        cidr_block = "10.0.20.0/27"
        public     = true
      },
    ]
  }
}