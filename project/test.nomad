job "test" {
  datacenters = ["dc1"]
  type        = "batch"

  group "app" {
    network {
      mode = "bridge"
    }

    service {
      name = "test"

      connect {
        sidecar_service {
          proxy {
            upstreams {
              destination_name   = "learn"
              local_bind_port    = 9001
              local_bind_address = "127.0.0.1"
            }
          }          
        }
      }
    }  

    task "app" {
      driver = "docker"

      config {
        image = "test:0.0.0"
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
