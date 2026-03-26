resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "${var.env}-${var.db_name}-Infra-App-DB"
  billing_mode = "PAY_PER_REQUEST"
  # Delete read_capacity and write_capacity lines
  hash_key     = var.db_hash_key

  attribute {
    name = var.db_hash_key
    type = "S"
  }

  tags = {
      Name = "${var.env}-Infra-DB"
      Environment = var.env
   }
}
