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

variable "region" {
  description = "The Alibaba Cloud region."
  type        = string
  default     = "cn-hangzhou"
}

variable "project_name" {
  description = "The name of the SLS log project."
  type        = string
}

variable "logstore_name" {
  description = "The name of the SLS logstore."
  type        = string
}

variable "export_name" {
  description = "The name of the log export job."
  type        = string
}

variable "display_name" {
  description = "The display name of the log export job."
  type        = string
  default     = null
}

variable "description" {
  description = "The description of the log export job."
  type        = string
  default     = null
}

variable "bucket" {
  description = "The name of the OSS bucket for log export."
  type        = string
}

variable "role_arn" {
  description = "The ARN of the RAM role for writing to OSS."
  type        = string
  sensitive   = true
}

variable "log_read_role_arn" {
  description = "The ARN of the RAM role for reading logs. If not set, role_arn will be used."
  type        = string
  default     = null
  sensitive   = true
}

variable "buffer_interval" {
  description = "The buffer interval in seconds for log export. Valid values: 300-900."
  type        = number
  default     = 300
  validation {
    condition     = var.buffer_interval >= 300 && var.buffer_interval <= 900
    error_message = "The buffer_interval must be between 300 and 900 seconds."
  }
}

variable "buffer_size" {
  description = "The buffer size in MB for log export. Valid values: 5-256."
  type        = number
  default     = 256
  validation {
    condition     = var.buffer_size >= 5 && var.buffer_size <= 256
    error_message = "The buffer_size must be between 5 and 256 MB."
  }
}

variable "compress_type" {
  description = "The compression type for log export. Valid values: none, snappy, gzip, zstd."
  type        = string
  default     = "none"
  validation {
    condition     = contains(["none", "snappy", "gzip", "zstd"], var.compress_type)
    error_message = "The compress_type must be one of: none, snappy, gzip, zstd."
  }
}

variable "content_type" {
  description = "The content type for log export. Valid values: json, parquet, csv, orc."
  type        = string
  default     = "json"
  validation {
    condition     = contains(["json", "parquet", "csv", "orc"], var.content_type)
    error_message = "The content_type must be one of: json, parquet, csv, orc."
  }
}

variable "time_zone" {
  description = "The time zone for log export."
  type        = string
  default     = "+0800"
}

variable "path_format" {
  description = "The path format for exported files in OSS."
  type        = string
  default     = "%Y/%m/%d/%H/%M"
}

variable "prefix" {
  description = "The prefix for OSS objects."
  type        = string
  default     = null
}

variable "suffix" {
  description = "The suffix for OSS objects."
  type        = string
  default     = null
}

variable "from_time" {
  description = "The start time for log export as a Unix timestamp."
  type        = string
  default     = "1"
}

variable "to_time" {
  description = "The end time for log export as a Unix timestamp. Use 0 for continuous export."
  type        = string
  default     = "0"
}

variable "json_enable_tag" {
  description = "Whether to enable tags for JSON format export."
  type        = bool
  default     = false
}

variable "csv_config" {
  description = "The CSV format configuration for log export."
  type = object({
    delimiter = optional(string, ",")
    columns   = optional(list(string), [])
    null      = optional(string, "")
    quote     = optional(string, "\"")
    header    = optional(bool, false)
    linefeed  = optional(string, "\n")
    escape    = optional(string, "\\")
  })
  default = {}
}
