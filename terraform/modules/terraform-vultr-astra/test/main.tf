module "astra" {
  source       = "../"
  flight_count = 1
  machine_type = "vc2-4c-8gb"
  region       = "ewr"
}
