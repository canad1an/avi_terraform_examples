terraform {
  required_providers {
    avi = {
      source = "vmware/avi"
      version = "22.1.6"
    }
  }
}

provider "avi" {
  avi_username   = var.avi_user
  avi_tenant     = var.avi_tenant
  avi_password   = var.avi_pass
  avi_controller = var.avi_controller
  avi_version    = var.avi_version
}