#Avi
variable "avi_version" {
  description = "The Version of Avi Controller"
  type        = string
  default     = "22.1.5"
}
variable "avi_controller" {
  description = "The IP of Avi Controller"
  type        = string
  default     = "CONTROLLERIP"
}
variable "avi_user" {
  description = "The username of Avi Controller"
  type        = string
  default     = "admin"
}
variable "avi_pass" {
  description = "The password of Avi Controller"
  type        = string
  default     = "password123"
}
variable "avi_tenant" {
  description = "The tenant of Avi Controller"
  type        = string
  default     = "admin"
}
variable "avi_cloud" {
  description = "The Cloud of Avi Controller"
  type        = string
  default     = "vcenter"
}

#Application Info
variable "app_name" {
  description = "The App name"
  type        = string
  default     = "test-app-1"
}
variable "app_appprofile" {
  description = "The App Profile"
  type        = string
  default     = "System-HTTP"
}
variable "app_networkprofile" {
  description = "The Network Profile"
  type        = string
  default     = "System-TCP-Proxy"
}
variable "app_listening_port" {
  description = "The Listening Port"
  type        = string
  default     = "80"
}
variable "app_backend_pool" {
  description = "The Backend Pool Member"
  type        = string
  default     = "8.8.8.8"
}
variable "app_backend_default_port" {
  description = "The Backend Default Port"
  type        = string
  default     = "443"
}