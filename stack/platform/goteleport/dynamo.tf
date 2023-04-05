/*
DynamoDB is used to store cluster state, event
metadata, and a simple locking mechanism for SSL
cert generation and renewal.
*/

// DynamoDB table for storing cluster state
resource "aws_dynamodb_table" "teleport" {
  name = local.cluster_name
  # read_capacity  = 1
  # write_capacity = 1
  # read_capacity  = 10
  # write_capacity = 10
  hash_key     = "HashKey"
  range_key    = "FullPath"
  billing_mode = "PAY_PER_REQUEST"

  // For demo purposes, CMK isn't necessary
  // tfsec:ignore:aws-dynamodb-table-customer-key
  # checkov:skip=CKV_AWS_119: For demo purposes, CMK isn't necessary
  server_side_encryption {
    enabled = true
  }

  point_in_time_recovery {
    enabled = true
  }

  lifecycle {
    ignore_changes = [
      read_capacity,
      write_capacity,
    ]
  }

  attribute {
    name = "HashKey"
    type = "S"
  }

  attribute {
    name = "FullPath"
    type = "S"
  }

  stream_enabled   = "true"
  stream_view_type = "NEW_IMAGE"

  ttl {
    attribute_name = "Expires"
    enabled        = true
  }

  tags = {
    TeleportCluster = local.cluster_name
  }
}

# resource "aws_appautoscaling_target" "teleport" {
#   resource_id        = "table/${aws_dynamodb_table.teleport.name}"
#   scalable_dimension = "dynamodb:table:ReadCapacityUnits"
#   service_namespace  = "dynamodb"
#   min_capacity       = 1
#   max_capacity       = 2
# }

# resource "aws_appautoscaling_policy" "teleport" {
#   name               = "rcu-auto-scaling-${aws_dynamodb_table.teleport_locks.name}"
#   service_namespace  = aws_appautoscaling_target.teleport.service_namespace
#   scalable_dimension = aws_appautoscaling_target.teleport.scalable_dimension
#   resource_id        = aws_appautoscaling_target.teleport.id
#   policy_type        = "TargetTrackingScaling"
# 
#   target_tracking_scaling_policy_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "DynamoDBReadCapacityUtilization"
#     }
#   }
# }

// DynamoDB table for storing cluster events
resource "aws_dynamodb_table" "teleport_events" {
  name = "${local.cluster_name}-events"
  # read_capacity  = 1
  # write_capacity = 1
  # read_capacity  = 10
  # write_capacity = 10
  hash_key     = "SessionID"
  range_key    = "EventIndex"
  billing_mode = "PAY_PER_REQUEST"

  // For demo purposes, CMK isn't necessary
  // tfsec:ignore:aws-dynamodb-table-customer-key
  # checkov:skip=CKV_AWS_119: For demo purposes, CMK isn't necessary
  server_side_encryption {
    enabled = true
  }

  point_in_time_recovery {
    enabled = true
  }

  global_secondary_index {
    name      = "timesearchV2"
    hash_key  = "CreatedAtDate"
    range_key = "CreatedAt"
    # write_capacity = 1
    # read_capacity  = 1
    # write_capacity  = 10
    # read_capacity   = 10
    projection_type = "ALL"
  }

  lifecycle {
    ignore_changes = all
  }

  attribute {
    name = "SessionID"
    type = "S"
  }

  attribute {
    name = "EventIndex"
    type = "N"
  }

  attribute {
    name = "CreatedAtDate"
    type = "S"
  }

  attribute {
    name = "CreatedAt"
    type = "N"
  }

  ttl {
    attribute_name = "Expires"
    enabled        = true
  }

  tags = {
    TeleportCluster = local.cluster_name
  }
}

# resource "aws_appautoscaling_target" "teleport_events" {
#   resource_id        = "table/${aws_dynamodb_table.teleport_events.name}"
#   scalable_dimension = "dynamodb:table:ReadCapacityUnits"
#   service_namespace  = "dynamodb"
#   min_capacity       = 1
#   max_capacity       = 2
# }

# resource "aws_appautoscaling_policy" "teleport_events" {
#   name               = "rcu-auto-scaling-${aws_dynamodb_table.teleport_locks.name}"
#   service_namespace  = aws_appautoscaling_target.teleport_events.service_namespace
#   scalable_dimension = aws_appautoscaling_target.teleport_events.scalable_dimension
#   resource_id        = aws_appautoscaling_target.teleport_events.id
#   policy_type        = "TargetTrackingScaling"
# 
#   target_tracking_scaling_policy_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "DynamoDBReadCapacityUtilization"
#     }
#   }
# }

// DynamoDB table for simple locking mechanism
resource "aws_dynamodb_table" "teleport_locks" {
  name = "${local.cluster_name}-locks"
  # read_capacity  = 1
  # write_capacity = 1
  # read_capacity  = 5
  # write_capacity = 5
  hash_key = "Lock"

  // For demo purposes, CMK isn't necessary
  // tfsec:ignore:aws-dynamodb-table-customer-key
  # checkov:skip=CKV_AWS_119: For demo purposes, CMK isn't necessary
  server_side_encryption {
    enabled = true
  }

  point_in_time_recovery {
    enabled = true
  }

  billing_mode = "PAY_PER_REQUEST"

  lifecycle {
    ignore_changes = [
      read_capacity,
      write_capacity,
    ]
  }

  attribute {
    name = "Lock"
    type = "S"
  }

  ttl {
    attribute_name = "Expires"
    enabled        = true
  }

  tags = {
    TeleportCluster = local.cluster_name
  }
}

# resource "aws_appautoscaling_target" "teleport_locks" {
#   resource_id        = "table/${aws_dynamodb_table.teleport_locks.name}"
#   scalable_dimension = "dynamodb:table:ReadCapacityUnits"
#   service_namespace  = "dynamodb"
#   min_capacity       = 1
#   max_capacity       = 2
# }

# resource "aws_appautoscaling_policy" "teleport_locks" {
#   name               = "rcu-auto-scaling-${aws_dynamodb_table.teleport_locks.name}"
#   service_namespace  = aws_appautoscaling_target.teleport_locks.service_namespace
#   scalable_dimension = aws_appautoscaling_target.teleport_locks.scalable_dimension
#   resource_id        = aws_appautoscaling_target.teleport_locks.id
#   policy_type        = "TargetTrackingScaling"
# 
#   target_tracking_scaling_policy_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "DynamoDBReadCapacityUtilization"
#     }
#   }
# }
