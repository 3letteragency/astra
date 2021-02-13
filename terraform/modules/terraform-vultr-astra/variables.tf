variable "flight_count" {
  type    = number
  default = 1
}

variable "machine_type" {
  type    = string
  default = "hfc-6c-24gb"
}

variable "region" {
  type    = string
  default = "ewr"
}

variable "astra_image_version" {
  type    = string
  default = ""
}
