variable "instance_types" {
  # default = ["t3.small", "t3.medium", "c6i.xlarge"]
  default = [
    "t3.small",  # 11 pods
    "t3.medium", # 17 pods
    "t3.xlarge", # 58 pods
  ]
  type = list(string)
}

variable "desired_size" {
  default = 3
  type    = number
}

variable "max_size" {
  default = 20
  type    = number
}

variable "min_size" {
  default = 3
  type    = number
}
