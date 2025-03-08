terraform {
  backend "local" {
    path = "./terraform.tfstate"  
  }
}

# Assign workspace dynamically
locals {
  namespace = terraform.workspace
}


# terraform {
#   backend "s3" {
#     bucket         = "your-terraform-backend-bucket"
#     key            = "terraform/${terraform.workspace}/state"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-lock"
#   }
# }
# Now switched to local backend for testing 
