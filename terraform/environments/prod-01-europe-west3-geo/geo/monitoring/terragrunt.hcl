terraform {
  source = "../../../../modules/monitoring"

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

dependency "application_instance" {
  config_path = "../application_instance"
  mock_outputs = {
    app-vpc = "fake-vpc"
    app-subnetwork = "fake-subnetwork"
  }
}

dependencies {
  paths = ["../application_instance"]
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project       = "capybara-prod-427207"
  region        = "europe-west3"
  zone          = "europe-west3-c"
  env           = "prod-01"
  app-vpc = dependency.application_instance.outputs.app-vpc
  app-subnetwork = dependency.application_instance.outputs.app-subnetwork
}
