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
  project       = "capybara-prod-427207"
  region        = "europe-west3"
  zone          = "europe-west3-c"
  env           = "prod-01"
  machine_type  = "e2-micro"
  custom_labels = {}
  enable_ssl    = false
}
