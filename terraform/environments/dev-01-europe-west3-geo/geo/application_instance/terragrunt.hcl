terraform {
  source = "../../../../modules/application_instance"

  extra_arguments "custom_args" {
    commands = [
      "apply",
      "destroy"
    ]
    arguments = [
      "-auto-approve",
      "-no-color"
    ]
  }

  extra_arguments "plan_args" {
    commands  = ["plan"]
    arguments = ["-no-color"]
  }
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project       = "capybara-dev-42069"
  region        = "europe-west3"
  zone          = "europe-west3-c"
  env           = "dev-01"
  machine_type  = "e2-medium"
  custom_labels = {}
  enable_ssl    = false
  subnetwork    = "10.100.0.0/20"
}
