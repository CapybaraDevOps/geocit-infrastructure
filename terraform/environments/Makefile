GEO_ENV ?= dev-01-europe-west3-geo

init:
	terragrunt init --terragrunt-working-dir ${GEO_ENV}/geo/postgresql
	terragrunt init --terragrunt-working-dir ${GEO_ENV}/geo/application_instance
	terragrunt init --terragrunt-working-dir ${GEO_ENV}/geo/monitoring

plan: init
	terragrunt plan --terragrunt-working-dir ${GEO_ENV}/geo/postgresql
	terragrunt plan --terragrunt-working-dir ${GEO_ENV}/geo/application_instance
	terragrunt plan --terragrunt-working-dir ${GEO_ENV}/geo/monitoring

apply: init
	terragrunt apply --terragrunt-working-dir ${GEO_ENV}/geo/postgresql
	terragrunt apply --terragrunt-working-dir ${GEO_ENV}/geo/application_instance
	terragrunt apply --terragrunt-working-dir ${GEO_ENV}/geo/monitoring

destroy: init
	terragrunt destroy --terragrunt-working-dir ${GEO_ENV}/geo/postgresql
	terragrunt destroy --terragrunt-working-dir ${GEO_ENV}/geo/application_instance
	terragrunt destroy --terragrunt-working-dir ${GEO_ENV}/geo/monitoring
