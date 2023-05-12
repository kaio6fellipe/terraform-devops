variable "cdirs_acesso_remoto" {
  description = "Remote access CIDR for SGs in hosts associated with public subnets"
  type        = list(string)
  # default     = ["0.0.0.0/0"]
  default = [
    "168.196.72.0/22",  #TurboNet
    "45.239.100.0/22",  #TurboNet
    "170.233.164.0/22", #TurboNet
    "201.131.68.0/22",  #TurboNet
    "131.255.68.0/22",  #TurboNet
    "201.33.192.0/20",  #VBTelecom
    "168.227.32.0/22",  #VBTelecom
    "186.209.64.0/20",  #Cligue
    "131.0.200.0/22",   #Cligue
    "143.255.232.0/22", #Cligue
    "177.125.200.0/22", #Cligue
    "191.253.32.0/21",  #Cligue
    "170.244.252.0/22", #Cligue
    "163.116.224.0/24", #Proxy
  ]
}

variable "cdirs_uptime_robot_monitoring" {
  description = "Remote monitoring CIDR for SGs in hosts associated with public subnets"
  type        = list(string)
  # default     = ["0.0.0.0/0"]
  default = [
    "69.162.124.224/28",  #UptimeRobot
    "63.143.42.240/28",   #UptimeRobot
    "216.245.221.80/28",  #UptimeRobot
    "208.115.199.16/28",  #UptimeRobot
    "216.144.248.16/28",  #UptimeRobot
    "104.131.107.63/32",  #UptimeRobot
    "122.248.234.23/32",  #UptimeRobot
    "128.199.195.156/32", #UptimeRobot
    "138.197.150.151/32", #UptimeRobot
    "139.59.173.249/32",  #UptimeRobot
    "146.185.143.14/32",  #UptimeRobot
    "159.203.30.41/32",   #UptimeRobot
    "159.89.8.111/32",    #UptimeRobot
    "165.227.83.148/32",  #UptimeRobot
    "178.62.52.237/32",   #UptimeRobot
    "18.221.56.27/32",    #UptimeRobot
    "167.99.209.234/32",  #UptimeRobot
    "216.144.250.150/32", #UptimeRobot
    "34.233.66.117/32",   #UptimeRobot
    "46.101.250.135/32",  #UptimeRobot
    "46.137.190.132/32",  #UptimeRobot
    "52.60.129.180/32",   #UptimeRobot
    "54.64.67.106/32",    #UptimeRobot
    "54.67.10.127/32",    #UptimeRobot
    "54.79.28.129/32",    #UptimeRobot
    "54.94.142.218/32",   #UptimeRobot
  ]
}

# variable "SSH_PRIVATE_KEY" {
#   description = "SSH Private Key for Ansible Server (Controller)"
#   type        = string
#   sensitive   = true
# }
# 
# variable "AWS_RDS_PASSWORD" {
#   description = "AWS RDS generic root password"
#   type        = string
#   sensitive   = true
# }
# 
# variable "ANSIBLE_VAULT_PASSWORD" {
#   description = "Ansible vault root password"
#   type        = string
#   sensitive   = true
# }
# 
# variable "ADMIN_USER_ARN" {
#   description = "EKS admin user ARN"
#   type        = string
#   sensitive   = true
# }
# 
# variable "ADMIN_USER_NAME" {
#   description = "EKS admin user name"
#   type        = string
#   sensitive   = true
# }
# 
# variable "GITHUB_ACTIONS_CIDR" {
#   description = "GitHub Actions egress CIDR Block"
#   default     = ["0.0.0.0/0"]
#   type        = list(string)
# }
