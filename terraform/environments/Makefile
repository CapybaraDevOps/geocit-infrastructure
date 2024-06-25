GOGS_ENV ?= dev-01-europe-west3-geo

init:
	cd ${GOGS_ENV}/geo/postgresql && terragrunt init
	cd ${GOGS_ENV}/geo/application_instance && terragrunt init
	cd ${GOGS_ENV}/geo/monitoring && terragrunt init

plan: init
	cd ${GOGS_ENV}/geo/postgresql && terragrunt plan
	cd ${GOGS_ENV}/geo/application_instance && terragrunt plan
	cd ${GOGS_ENV}/geo/monitoring && terragrunt plan

apply: init
	cd ${GOGS_ENV}/geo/postgresql && terragrunt apply
	cd ${GOGS_ENV}/geo/application_instance && terragrunt apply
	cd ${GOGS_ENV}/geo/monitoring && terragrunt apply

destroy: init
	cd ${GOGS_ENV}/geo/postgresql && terragrunt destroy
	cd ${GOGS_ENV}/geo/application_instance && terragrunt destroy
	cd ${GOGS_ENV}/geo/monitoring && terragrunt destroy
