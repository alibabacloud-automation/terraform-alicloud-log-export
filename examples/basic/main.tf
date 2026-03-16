data "alicloud_account" "default" {}

resource "random_integer" "default" {
  min = 10000
  max = 99999
}

resource "alicloud_log_project" "default" {
  project_name = "tf-test-log-export-${random_integer.default.result}"
}

resource "alicloud_log_store" "default" {
  project_name  = alicloud_log_project.default.project_name
  logstore_name = "tf-test-logstore"
}

resource "alicloud_oss_bucket" "default" {
  bucket = "tf-test-log-export-${random_integer.default.result}"
}

module "log_export" {
  source = "../.."

  project_name  = alicloud_log_project.default.project_name
  logstore_name = alicloud_log_store.default.logstore_name
  export_name   = "tf-test-export-basic"
  bucket        = alicloud_oss_bucket.default.bucket
  role_arn      = "acs:ram::${data.alicloud_account.default.id}:role/aliyunlogdefaultrole"
  region        = "cn-hangzhou"
}
