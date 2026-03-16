/**
 * Copyright 2026 Alibaba Cloud
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
