terraform {
  source = "../.."
}

inputs = {
  nginx_name = "nginx_local"
  nginx_external_port = 8081
}
