provider "google" {
  project = "dacn-445009"  # Thay bằng ID của project GCP
  region  = "us-central1"  # Vùng chính của project
}

resource "google_container_cluster" "primary" {
  name     = "gke-cluster"
  location = "us-central1-c"  # Zone cho cluster

  initial_node_count = 3  # Số lượng node ban đầu

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 80
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}
