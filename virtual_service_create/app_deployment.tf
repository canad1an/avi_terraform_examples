data "avi_tenant" "main" {
  name = var.avi_tenant
}

data "avi_cloud" "main" {
  name = var.avi_cloud
}

data "avi_applicationprofile" "main" {
  name = var.app_appprofile
}

data "avi_networkprofile" "main" {
  name = var.app_networkprofile
}

data "avi_vrfcontext" "main" {
  name = "global"
  cloud_ref = data.avi_cloud.main.id
}

resource "avi_pool" "lb_pool" {
  name    = "${var.app_name}-pool"
  servers {
    ip {
          type = "V4"
      addr = var.app_backend_pool
    }
  }
  default_server_port = var.app_backend_default_port
  cloud_ref = data.avi_cloud.main.id
  tenant_ref = data.avi_tenant.main.id
}

resource "avi_vsvip" "lb_vsvip" {
  name    = "${var.app_name}-vsvip"
  vip {
    vip_id                = "0"
    auto_allocate_ip      = true
    auto_allocate_ip_type = "V4_ONLY"

  }
  cloud_ref = data.avi_cloud.main.id
  tenant_ref = data.avi_tenant.main.id
  vrf_context_ref = data.avi_vrfcontext.main.id
}

resource "avi_virtualservice" "lb_vs" {
  name    = "${var.app_name}-vs"
  pool_ref                = avi_pool.lb_pool.id
  cloud_ref = data.avi_cloud.main.id
  tenant_ref = data.avi_tenant.main.id
  vsvip_ref = avi_vsvip.lb_vsvip.id
  application_profile_ref       = data.avi_applicationprofile.main.id
  network_profile_ref           = data.avi_networkprofile.main.id
  services {
    port           = var.app_listening_port
    enable_ssl     = false
  }
}