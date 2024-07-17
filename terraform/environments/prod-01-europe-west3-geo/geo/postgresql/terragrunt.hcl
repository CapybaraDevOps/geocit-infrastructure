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
    app-vpc-id = "projects/capybara-stage/global/networks/default"
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
  app-subnetwork = dependency.application_instance.outputs.app-subnetwork
  app-vpc = dependency.application_instance.outputs.app-vpc
  app-vpc-id = dependency.application_instance.outputs.app-vpc-id
}
