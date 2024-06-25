# GeoCit Infrastructure Deployment

Use this Terragrunt code to deploy PostgreSQL, Monitoring, and Goocitizen application.

## Prerequisites

- **Authorization in Google Cloud (gcloud)**: Ensure you are authenticated and authorized to use gcloud.
- **Make**: Ensure you have `make` installed on your system to run the Makefile commands.

## Deployment
Before deploying the infrastructure create a bucket by using ``terragrunt apply`` in **tf_state** folder
### Initialization

To initialize the Terragrunt configurations, run:
``
make init
``

### Planning

To create an execution plan, run:
``
make plan
``

### Apply

To apply the configuration and deploy the infrastructure, run:
``
make apply
``

### Destroy

To destroy the infrastructure, run:
``
make destroy
``

## Changing the Environment

You can change the environment by modifying the `GOGS_ENV` variable in the Makefile. The default environment is `dev-01-europe-west3-geo`. 
