provider "google" {
    credentials = "${file("/root/.gcp-account.json")}"
    project     = "cognixia-1607499012052"
    region      = "us-central1"
}


resource "google_compute_instance" "vm" { 
    name            = "t-01"
    machine_type    = "ec2-micro"
    zone            = "us-central1-a"


    boot_disk { 
        initialize_params { 
            image = "debian-cloud/debain-12"
        }
    }

    network_interface { 
        network  = "default"
        access_config {
        }
    }
}