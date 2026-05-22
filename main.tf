terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "cs-host-0f6565737878444fa4304f"
  region  = "us-central1"
}

# Artifact Registry repository
resource "google_artifact_registry_repository" "wildfire_repo" {
  location      = "us-central1"
  repository_id = "wildfire-repo"
  format        = "DOCKER"
  description   = "Wildfire dashboard container images"
}

# Cloud Run service
resource "google_cloud_run_v2_service" "wildfire_dashboard" {
  name     = "wildfire-dashboard"
  location = "us-central1"

  template {
    containers {
      image = "us-central1-docker.pkg.dev/cs-host-0f6565737878444fa4304f/wildfire-repo/wildfire-dashboard:latest"
      ports {
        container_port = 80
      }
    }
  }
}
