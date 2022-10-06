job "terminating" {
  datacenters = ["dc1"]
  type        = "service"

  group "gateway" {
    network {
      mode = "bridge"
    }

    service {
      name = "api-gateway"

      connect {
        gateway {
          proxy {}

          terminating {
            service {
              name = "learn"
              ca_file = "/etc/ssl/certs/ca-certificates.crt"
              sni     = "www.google.com"
            }
          }
        }
      }
    }
  }
}