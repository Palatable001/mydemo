provider "google" {
  project = "mike-428601"
  region  = "us-west1"
  zone    = "us-west1-a"
}

resource "google_project_iam_member" "sa-iam" {
  project = "mike-428601"
  member  = "serviceAccount:gkeservices@mike-428601.iam.gserviceaccount.com"
  role    = "roles/container.admin"
}

resource "google_container_cluster" "primary" {
  name               = "terraform-cluster"
  location           = "us-west1-a"
  initial_node_count = 2
  deletion_protection = false

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 50
    service_account = "gkeservices@mike-428601.iam.gserviceaccount.com"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      foo = "bar"
    }
    tags = ["foo", "bar"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_location" {
  value = google_container_cluster.primary.location
}

output "node_count" {
  value = google_container_cluster.primary.initial_node_count
}

output "service_account" {
  value = google_container_cluster.primary.node_config[0].service_account
}
