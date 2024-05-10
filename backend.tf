terraform {
  backend "remote" {
    organization = var.org_name

    workspaces {
      name = "workspace-hml"
    }
  }
}
