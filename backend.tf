terraform {
  backend "remote" {
    organization = $VAR.ORG

    workspaces {
      name = "workspace-hml"
    }
  }
}
