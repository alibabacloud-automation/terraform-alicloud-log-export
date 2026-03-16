data "alicloud_account" "default" {}

resource "random_integer" "default" {
  min = 10000
  max = 99999
}

resource "alicloud_log_project" "default" {
  project_name = "tf-test-log-export-adv-${random_integer.default.result}"
}

resource "alicloud_log_store" "default" {
  project_name  = alicloud_log_project.default.project_name
  logstore_name = "tf-test-logstore"
}

resource "alicloud_oss_bucket" "default" {
  bucket = "tf-test-log-export-adv-${random_integer.default.result}"
}

module "log_export" {
  source = "../.."

  project_name      = alicloud_log_project.default.project_name
  logstore_name     = alicloud_log_store.default.logstore_name
  export_name       = "tf-test-export-advanced"
  display_name      = "Advanced Log Export Job"
  description       = "Advanced log export with custom configuration"
  bucket            = alicloud_oss_bucket.default.bucket
  role_arn          = "acs:ram::${data.alicloud_account.default.id}:role/aliyunlogdefaultrole"
  log_read_role_arn = "acs:ram::${data.alicloud_account.default.id}:role/aliyunlogdefaultrole"
  region            = "cn-hangzhou"

  buffer_interval = 600
  buffer_size     = 128
  compress_type   = "gzip"
  content_type    = "json"
  time_zone       = "+0800"
  path_format     = "%Y/%m/%d"
  prefix          = "logs/"
  suffix          = ".log"
  json_enable_tag = true

  from_time = "1718380800"
  to_time   = "0"
}
