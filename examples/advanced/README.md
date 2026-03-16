# Advanced Log Export Example

This example demonstrates a full-featured configuration for exporting SLS logs to OSS, including custom compression, buffer settings, path formatting, separate read/write roles, and JSON tag support.

## Terraform Commands

```bash
# Initialize Terraform
terraform init

# Generate execution plan
terraform plan

# Apply configuration
terraform apply

# Clean up resources
terraform destroy
```

## Cost Overview

This example creates the following resources:
- 1 SLS Project
- 1 SLS Logstore
- 1 OSS Bucket
- 1 Log Export Job with advanced configuration

**Note:** Running this example will incur charges for SLS and OSS resources. Additional costs may apply for advanced features like compression and custom path formatting.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.237.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.273.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.8.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_log_export"></a> [log\_export](#module\_log\_export) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |
| [alicloud_log_store.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_store) | resource |
| [alicloud_oss_bucket.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oss_bucket) | resource |
| [random_integer.default](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |
| [alicloud_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_export_display_name"></a> [export\_display\_name](#output\_export\_display\_name) | The display name of the log export job. |
| <a name="output_export_id"></a> [export\_id](#output\_export\_id) | The ID of the log export job. |
| <a name="output_export_job_name"></a> [export\_job\_name](#output\_export\_job\_name) | The name of the log export job. |
| <a name="output_export_status"></a> [export\_status](#output\_export\_status) | The status of the log export job. |
| <a name="output_logstore_name"></a> [logstore\_name](#output\_logstore\_name) | The name of the SLS logstore. |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | The name of the SLS log project. |
<!-- END_TF_DOCS -->
