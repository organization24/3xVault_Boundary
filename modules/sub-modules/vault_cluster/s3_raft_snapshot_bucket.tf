resource "aws_s3_bucket" "raft_snapshot_bucket" {
  bucket = "raft-snapshot-bucket-${var.region}-${var.random_id}"
  #acl           = "private" │ Use the aws_s3_bucket_acl resource instead
  force_destroy = true

  tags = {
    Name = "vault-${var.region}-${var.random_id}"
  }
}