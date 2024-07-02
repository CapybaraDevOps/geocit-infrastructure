terraform {
  source = "../../../modules/tf_state"

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

inputs = {
  env           = "stage-01"
  region        = "europe-west3"
  project       = "capybara-stage" 
}