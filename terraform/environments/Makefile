GEO_ENV ?= dev-01-europe-west3-geo

plan:
	terragrunt run-all plan --terragrunt-working-dir ${GEO_ENV}/geo

apply: 
	terragrunt run-all apply --terragrunt-working-dir ${GEO_ENV}/geo

destroy: 
	terragrunt run-all destroy --terragrunt-working-dir ${GEO_ENV}/geo
