terraform {
  source = "../.."
}

inputs = {
  nginx_name = "nginx_prod"
  nginx_external_port = 8080
}
