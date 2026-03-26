module "dev-infra" {
  source = "./infra-app"

  env = "dev"
  bucket_name = "2472737-aws-bucket"
  instance_count = 2
  instance_type = "t3.micro"
  ami_id = "ami-0f559c3642608c138"
  db_name = "2472737-aws-db"
  db_hash_key = "LockID"
}
module "stage-infra" {
  source = "./infra-app"

  env = "stage"
  bucket_name = "2472737-aws-bucket"
  instance_count = 1
  instance_type = "t3.micro"
  ami_id = "ami-0f559c3642608c138"
  db_name = "2472737-aws-db"
  db_hash_key = "LockID"
}
module "prod-infra" {
  source = "./infra-app"

  env = "prod"
  bucket_name = "2472737-aws-bucket"
  instance_count = 2
  instance_type = "t3.micro"
  ami_id = "ami-0f559c3642608c138"
  db_name = "2472737-aws-db"
  db_hash_key = "LockID"
}
