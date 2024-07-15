terraform {
  source = "../../../../modules/postgresql"

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
  project       = "capybara-stage"
  region        = "europe-west3"
  zone          = "europe-west3-c"
  env           = "stage-01"
  app-subnetwork = dependency.application_instance.outputs.app-subnetwork
  app-vpc = dependency.application_instance.outputs.app-vpc
  
}
