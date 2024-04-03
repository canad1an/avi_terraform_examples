output "ip" {
value = avi_vsvip.lb_vsvip.vip.0.ip_address[*].addr
}