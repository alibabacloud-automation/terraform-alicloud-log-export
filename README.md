Alibaba Cloud SLS Log Export to OSS Terraform Module

# terraform-alicloud-log-export

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-log-export/blob/main/README-CN.md)

This Terraform module provides functionality to export logs from Alibaba Cloud [Log Service (SLS)](https://www.alibabacloud.com/help/en/sls/) to [Object Storage Service (OSS)](https://www.alibabacloud.com/help/en/oss/), similar to Google Cloud Platform's log export functionality. It allows you to ship log data from SLS logstores to OSS buckets for long-term storage, analysis, or archival purposes.

## Features

- Export logs from SLS logstores to OSS buckets
- Support for multiple export formats (JSON, Parquet, CSV, ORC)
- Configurable compression options (none, snappy, gzip, zstd)
- Flexible path formatting with time-based directory structures
- Buffer configuration for controlling export frequency and size
- Role-based access control for secure data transfer

## Usage

Export SLS logs to OSS with basic configuration:

```terraform
module "log_export" {
  source = "alibabacloud-automation/log-export/alicloud"

  project_name  = "my-log-project"
  logstore_name = "my-logstore"
  export_name   = "my-export-job"
  bucket        = "my-oss-bucket"
  role_arn      = "acs:ram::12345678901234567:role/aliyunlogdefaultrole"
  region        = "cn-hangzhou"
}
```

## Examples

* [Basic Example](https://github.com/alibabacloud-automation/terraform-alicloud-log-export/tree/main/examples/basic)
* [Advanced Example](https://github.com/alibabacloud-automation/terraform-alicloud-log-export/tree/main/examples/advanced)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.237.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.237.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_sls_oss_export_sink.log_export](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/sls_oss_export_sink) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The name of the OSS bucket for log export. | `string` | n/a | yes |
| <a name="input_buffer_interval"></a> [buffer\_interval](#input\_buffer\_interval) | The buffer interval in seconds for log export. Valid values: 300-900. | `number` | `300` | no |
| <a name="input_buffer_size"></a> [buffer\_size](#input\_buffer\_size) | The buffer size in MB for log export. Valid values: 5-256. | `number` | `256` | no |
| <a name="input_compress_type"></a> [compress\_type](#input\_compress\_type) | The compression type for log export. Valid values: none, snappy, gzip, zstd. | `string` | `"none"` | no |
| <a name="input_content_type"></a> [content\_type](#input\_content\_type) | The content type for log export. Valid values: json, parquet, csv, orc. | `string` | `"json"` | no |
| <a name="input_csv_config"></a> [csv\_config](#input\_csv\_config) | The CSV format configuration for log export. | <pre>object({<br/>    delimiter = optional(string, ",")<br/>    columns   = optional(list(string), [])<br/>    null      = optional(string, "")<br/>    quote     = optional(string, "\"")<br/>    header    = optional(bool, false)<br/>    linefeed  = optional(string, "\n")<br/>    escape    = optional(string, "\\")<br/>  })</pre> | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the log export job. | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name of the log export job. | `string` | `null` | no |
| <a name="input_export_name"></a> [export\_name](#input\_export\_name) | The name of the log export job. | `string` | n/a | yes |
| <a name="input_from_time"></a> [from\_time](#input\_from\_time) | The start time for log export as a Unix timestamp. | `string` | `"1"` | no |
| <a name="input_json_enable_tag"></a> [json\_enable\_tag](#input\_json\_enable\_tag) | Whether to enable tags for JSON format export. | `bool` | `false` | no |
| <a name="input_log_read_role_arn"></a> [log\_read\_role\_arn](#input\_log\_read\_role\_arn) | The ARN of the RAM role for reading logs. If not set, role\_arn will be used. | `string` | `null` | no |
| <a name="input_logstore_name"></a> [logstore\_name](#input\_logstore\_name) | The name of the SLS logstore. | `string` | n/a | yes |
| <a name="input_path_format"></a> [path\_format](#input\_path\_format) | The path format for exported files in OSS. | `string` | `"%Y/%m/%d/%H/%M"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix for OSS objects. | `string` | `null` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the SLS log project. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The Alibaba Cloud region. | `string` | `"cn-hangzhou"` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | The ARN of the RAM role for writing to OSS. | `string` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | The suffix for OSS objects. | `string` | `null` | no |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | The time zone for log export. | `string` | `"+0800"` | no |
| <a name="input_to_time"></a> [to\_time](#input\_to\_time) | The end time for log export as a Unix timestamp. Use 0 for continuous export. | `string` | `"0"` | no |

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

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
