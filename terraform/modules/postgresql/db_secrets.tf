resource "random_password" "db_password" {
  length  = 16
  special = false
}

resource "google_secret_manager_secret" "database_credentials" {
  secret_id = "${var.env}-${var.region}-geo-database-credentials"
  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

resource "google_secret_manager_secret_version" "db_password_version" {
  secret      = google_secret_manager_secret.database_credentials.id
  secret_data = random_password.db_password.result
}
