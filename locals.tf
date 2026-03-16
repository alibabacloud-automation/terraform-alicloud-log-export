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

locals {
  # Use log_read_role_arn if specified, otherwise fall back to role_arn
  log_read_role_arn = coalesce(var.log_read_role_arn, var.role_arn)

  # OSS internal endpoint derived from region
  oss_endpoint = "https://oss-${var.region}-internal.aliyuncs.com"

  # Build content detail based on content type
  content_detail = jsonencode(
    var.content_type == "json" ? {
      enableTag = var.json_enable_tag
      } : var.content_type == "csv" ? {
      delimiter = var.csv_config.delimiter
      columns   = var.csv_config.columns
      null      = var.csv_config.null
      quote     = var.csv_config.quote
      header    = var.csv_config.header
      lineFeed  = var.csv_config.linefeed
      escape    = var.csv_config.escape
      } : var.content_type == "parquet" || var.content_type == "orc" ? {
      columns = var.csv_config.columns
    } : {}
  )
}
