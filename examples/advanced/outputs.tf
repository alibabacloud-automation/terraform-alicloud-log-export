output "export_job_name" {
  description = "The name of the log export job."
  value       = module.log_export.export_job_name
}

output "export_display_name" {
  description = "The display name of the log export job."
  value       = module.log_export.export_display_name
}

output "export_id" {
  description = "The ID of the log export job."
  value       = module.log_export.export_id
}

output "export_status" {
  description = "The status of the log export job."
  value       = module.log_export.export_status
}

output "project_name" {
  description = "The name of the SLS log project."
  value       = module.log_export.project_name
}

output "logstore_name" {
  description = "The name of the SLS logstore."
  value       = module.log_export.logstore_name
}
