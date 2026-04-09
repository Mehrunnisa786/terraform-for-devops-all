#DynamoDB is a schemaless database that requires only a table name and a primary key when you create the table.

resource "aws_dynamodb_table" "use_lockfile" {
  name           = "dynamodb-secure-state"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
     Name = "dynamodb-secure-state"
  }
}
