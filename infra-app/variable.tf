variable "env" {
  description = "Environment Name"
  type = string
}
variable "bucket_name" {
  description = "Bucket Name"
  type = string
}

variable "instance_count" {
  description = "Instance Count"
  type = number
}
variable "instance_type" {
  description = "Instance Type"
  type = string
}
variable "ami_id" {
  description = "AMI Id"
  type = string
}

variable "db_name" {
  description = "Dynamo DB Name"
  type = string
}

variable "db_hash_key" {
  description = "Dynamo DB Hash Key"
  type = string
}
