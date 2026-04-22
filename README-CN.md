阿里云 SLS 日志导出到 OSS Terraform 模块

# terraform-alicloud-log-export

[English](https://github.com/alibabacloud-automation/terraform-alicloud-log-export/blob/main/README.md) | 简体中文

本 Terraform 模块提供将日志从阿里云 [日志服务（SLS）](https://help.aliyun.com/zh/sls/) 导出到 [对象存储服务（OSS）](https://help.aliyun.com/zh/oss/) 的功能，类似于 Google Cloud Platform 的日志导出功能。它可以将 SLS 日志库中的日志数据传输到 OSS 存储桶中，用于长期存储、分析或归档。

## 功能特性

- 将日志从 SLS 日志库导出到 OSS 存储桶
- 支持多种导出格式（JSON、Parquet、CSV、ORC）
- 可配置的压缩选项（none、snappy、gzip、zstd）
- 基于时间的灵活路径格式化
- 可配置的缓冲区设置，控制导出频率和大小
- 基于角色的访问控制，确保安全的数据传输

## 使用方法

使用基础配置将 SLS 日志导出到 OSS：

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

## 示例

* [基础示例](https://github.com/alibabacloud-automation/terraform-alicloud-log-export/tree/main/examples/basic)
* [高级示例](https://github.com/alibabacloud-automation/terraform-alicloud-log-export/tree/main/examples/advanced)

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
| [alicloud_sls_oss_export_sink.log_export](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/sls_oss_export_sink) | resource |

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

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护 (terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
