terraform {
  backend "remote" {
    organization = "marcusvinicius"

    workspaces {
      name = "workspace-hml"
    }
  }
}