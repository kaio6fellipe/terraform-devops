// Auth, node, proxy (aka Teleport Cluster) on single AWS instance
resource "aws_instance" "cluster" {
  # checkov:skip=CKV_AWS_126: For demo purposes, don't need detailed monitoring for this EC2 instance
  # checkov:skip=CKV_AWS_88: For demo purposes, this instance must have public IP.
  # checkov:skip=CKV_AWS_135: For demo purposes, this EC2 does not need an optimized EBS
  key_name                    = var.key_name
  ami                         = data.aws_ami.base.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id_0
  vpc_security_group_ids      = [aws_security_group.cluster.id, var.default_sg]
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_role.cluster.id

  user_data = templatefile(
    "${abspath(path.cwd)}/multi-region/platform/goteleport/data.tpl",
    {
      region                   = var.region
      cluster_name             = local.cluster_name
      email                    = var.email
      domain_name              = local.route53_domain
      dynamo_table_name        = aws_dynamodb_table.teleport.name
      dynamo_events_table_name = aws_dynamodb_table.teleport_events.name
      locks_table_name         = aws_dynamodb_table.teleport_locks.name
      license_path             = var.license_path
      s3_bucket                = local.s3_bucket_name
      enable_mongodb_listener  = var.enable_mongodb_listener
      enable_mysql_listener    = var.enable_mysql_listener
      enable_postgres_listener = var.enable_postgres_listener
      use_acm                  = var.use_acm
      use_letsencrypt          = var.use_letsencrypt
    }
  )

  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = local.cluster_name
  }
}
