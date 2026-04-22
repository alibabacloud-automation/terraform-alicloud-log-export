# Create log export job
resource "alicloud_sls_oss_export_sink" "log_export" {
  project      = var.project_name
  job_name     = var.export_name
  display_name = coalesce(var.display_name, var.export_name)
  description  = var.description

  configuration {
    logstore  = var.logstore_name
    role_arn  = local.log_read_role_arn
    from_time = var.from_time
    to_time   = var.to_time

    sink {
      bucket           = var.bucket
      role_arn         = var.role_arn
      time_zone        = var.time_zone
      content_type     = var.content_type
      compression_type = var.compress_type
      buffer_interval  = var.buffer_interval
      buffer_size      = var.buffer_size
      endpoint         = local.oss_endpoint
      path_format      = var.path_format
      prefix           = var.prefix
      suffix           = var.suffix
      content_detail   = local.content_detail
    }
  }
}
