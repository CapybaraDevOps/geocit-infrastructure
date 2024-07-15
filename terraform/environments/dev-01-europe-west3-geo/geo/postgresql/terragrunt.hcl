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
  mock_outputs_allowed_terraform_commands = ["init", "plan", "validate"]
  mock_outputs = {
    app-vpc = "fake-vpc"
  }
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../application_instance"]
}

inputs = {
  project       = "capybara-dev-42069"
  region        = "europe-west3"
  zone          = "europe-west3-c"
  env           = "dev-01"
  app-vpc = dependency.application_instance.outputs.app-vpc
}
