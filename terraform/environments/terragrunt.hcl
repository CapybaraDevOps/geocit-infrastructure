remote_state {
  backend = "gcs"
config = {
    bucket = "${get_env("TF_VAR_GEO_ENV", "dev-01-europe-west3")}-state-bucket"
    prefix = "terraform/geo-state"
  }
generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}