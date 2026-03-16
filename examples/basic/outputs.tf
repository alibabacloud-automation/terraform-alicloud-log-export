output "export_job_name" {
  description = "The name of the log export job."
  value       = module.log_export.export_job_name
}

output "export_id" {
  description = "The ID of the log export job."
  value       = module.log_export.export_id
}
