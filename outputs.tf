output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "app_instance_info" {
  value = module.ec2_app.instance
}

output "bastion_instance_info" {
  value = module.ec2_bastion.instance
}

output "ebs_info" {
  value = {
    volume_id   = module.ebs.volume_id
    snapshot_id = module.ebs.snapshot_id
  }
}

output "keypair_info" {
  value = {
    key_name = module.keypair.key_name
  }
  sensitive = false
}
