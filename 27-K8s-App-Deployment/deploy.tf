provider kubernetes {
version = "~> 1.8"
  # leave blank to pickup config from kubectl config of local system
}

resource "kubernetes_deployment" "myapp_deployment" {
  metadata {
    name      = "myapp-deployment"
    namespace = "default"
    labels = {
      app = "myapp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "myapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "myapp"
        }
      }

      spec {
        container {
          name  = "myapp"
          image = "amitvashist7/mypython-web-app:v4"
          port {
            container_port = 8081
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "myapp_service" {
  metadata {
    name = "myapp-service"
  }

  spec {
    selector = {
      app = "myapp"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 8081
    }

    type = "LoadBalancer"
  }
}


output "lb_ip" {
  value = "${kubernetes_service.myapp_service.load_balancer_ingress.0.ip}"
}
