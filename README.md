# Wildfire Infrastructure — Terraform

Infrastructure as code for the Wildfire Dashboard GCP deployment, managed with Terraform.

## Stack
- **Terraform** — infrastructure as code
- **Google Cloud Platform** — cloud provider
- **Cloud Run** — serverless container deployment
- **Artifact Registry** — Docker image storage

## Resources managed

| Resource | Type | Description |
|----------|------|-------------|
| `wildfire-repo` | Artifact Registry | Docker image repository |
| `wildfire-dashboard` | Cloud Run service | Serves the ClojureScript dashboard |

## Usage

### Prerequisites
- Terraform 1.x+
- Google Cloud SDK (`gcloud`)
- GCP project with Cloud Run and Artifact Registry APIs enabled

### Setup
```bash
gcloud auth application-default login
terraform init
```

### Plan (dry run)
```bash
terraform plan
```

### Apply
```bash
terraform apply
```

### Tear down
```bash
terraform destroy
```

## Key concepts demonstrated
- Terraform provider configuration (Google Cloud)
- Resource definitions for Cloud Run and Artifact Registry
- Importing existing infrastructure into Terraform state
- Plan/apply workflow for safe infrastructure changes
- State management with `terraform.tfstate`

## Related repos
- [wildfire-dashboard](https://github.com/joolybugg/wildfire-dashboard) — the app this infrastructure serves
- [wildfire-geospatial](https://github.com/joolybugg/wildfire-geospatial) — PostGIS + GeoServer pipeline
