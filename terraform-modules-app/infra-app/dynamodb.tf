#DynamoDB is a schemaless database that requires only a table name and a primary key when you create the table.

resource "aws_dynamodb_table" "use_lockfile" {
  name           = "${var.env}-infra-app-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = var.hash-key
  
  attribute {
    name = var.hash-key
    type = "S"
  }
  tags = {
     Name = "${var.env}-infra-app-table"
     Environment = var.env
  }
}
