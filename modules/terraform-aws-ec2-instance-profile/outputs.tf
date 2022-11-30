output "ec2_profile_id" {
  value       = aws_iam_instance_profile.this.name
  description = "Returns the id of the ec2 profile"
}